/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package diffUtils4cj

public abstract class Delta<T> where T <: Equal<T> & ToString {
    /** The original chunk. */
    private var original: Chunk<T>
    /** The revised chunk. */
    private var revised: Chunk<T>

    /**
     * Creates a delta with the two given chunks.
     * 
     * @param original The original chunk. 
     * @param revised The original chunk.
     * 
     * @since 0.38.2
     */
    public init(original: Chunk<T>, revised: Chunk<T>) {
        this.original = original;
        this.revised = revised;
    }

    /**
     * Returns the type of delta
     *
     * @return the type enum
     *
     * @since 0.38.2
     */
    public func getType(): DeltaType

    /**
     * Returns the getOriginal
     *
     * @return the getOriginal
     *
     * @since 0.38.2
     */
    public func getOriginal(): Chunk<T> {
        return original;
    }
    
    /**
     * Set the getOriginal
     *
     * @Param set the Original
     *
     * @since 0.38.2
     */
    public func setOriginal(original: Chunk<T>): Unit {
        this.original = original;
    }

    /**
     * Returns the Revised
     *
     * @return the Revised
     *
     * @since 0.38.2
     */
    public func getRevised(): Chunk<T> {
        return revised
    }
    
    /**
     * Set the getRevised
     *
     * @Param set the Revised
     *
     * @since 0.38.2
     */
    public func setRevised(revised: Chunk<T>) {
        this.revised = revised
    }
}

public enum DeltaType {
    /** A change in the original. */
    | CHANGE
    /** A delete from the original. */
    | DELETE
    /** An insert into the original. */
    | INSERT
}