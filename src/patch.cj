/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package diffUtils4cj

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
        deltas.sortBy(DeltaComparator<T>.INSTANCE.deltaComparator, stable: false)
        return deltas
    }
}
