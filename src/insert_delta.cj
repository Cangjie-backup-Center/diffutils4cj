/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package diffUtils4cj

/**
 * Describes the insert-delta between original and revised texts.
 */
public class InsertDelta<T> <: Delta<T> where T <: Equal<T> & ToString{
    /**
     * Creates a insert delta with the two given chunks.
     * 
     * @param original The original chunk. 
     * @param revised The original chunk.
     * 
     * @since 0.38.2
     */
    public init(original: Chunk<T>, revised: Chunk<T> ) {
        super(original, revised);
    }

    /**
     * Returns the type of delta
     *
     * @return the type enum
     *
     * @since 0.38.2
     */
    public func getType(): DeltaType {
        return  DeltaType.INSERT
    }
}
