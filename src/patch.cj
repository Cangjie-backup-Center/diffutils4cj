/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2024. All rights reserved.
 */

package diffUtils4cj

import std.collection.*

/**
 * Describes the patch holding all deltas between the original and revised texts.
 */
public class Patch<T> where T <: Equal<T> & ToString {
    private var deltas:  ArrayList<Delta<T>> = ArrayList<Delta<T>>()

    /**
     * Set the deltas
     *
     * @Param set the deltas
     *
     * @since 0.38.2
     */
    public func addDelta(delta: Delta<T>): Unit {
        deltas.append(delta)
    }

    /**
     * Returns the deltas
     *
     * @return the deltas
     *
     * @since 0.38.2
     */
    public func getDeltas(): ArrayList<Delta<T>> {
        deltas.sortBy(stable: false, comparator: DeltaComparator<T>.INSTANCE.deltaComparator)
        return deltas
    }

    /**
     * Applies this delta as the patch for a given target
     * 
     * @param target the given target
     *
     * @since 0.39.3
     */
    public func applyTo(target: ArrayList<T>): ArrayList<T> {
        var result: ArrayList<T> =  ArrayList<T>(target)
        var deltas = getDeltas()
        var size = deltas.size
        while (size > 0) {
            deltas[size-1].applyTo(result)
            size --
        }
        return result
    }

    /**
     * Cancel this delta for a given revised text. The action is opposite to
     * patch.
     * 
     * @param target the given revised text
     *
     * @since 0.39.3
     */
    public func restore(target: ArrayList<T>): ArrayList<T> {
        var result: ArrayList<T> =  ArrayList<T>(target)
        var deltas = getDeltas()
        var size = deltas.size
        while (size > 0) {
            deltas[size-1].restore(result)
            size --
        }
        return result
    }
}
