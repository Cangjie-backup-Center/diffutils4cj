/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package diffUtils4cj
from std import regex.*

public class DiffUtils {

    private let  unifiedDiffChunkRe: Regex = Regex("^@@\\s+-(?:(\\d+)(?:,(\\d+))?)\\s+\\+(?:(\\d+)(?:,(\\d+))?)\\s+@@$")
    
    /**
     * Computes the difference between the original and revised list of elements
     * with default diff algorithm
     * 
     * @param original The original text. 
     * @param revised The revised text.
     * @return The patch describing the difference between the original and revised sequences.
     *   
     * @since 0.38.2
     */
    public static func diff<T>( original: ArrayList<T>, revised: ArrayList<T>): Patch<T> where T <: Equal<T> & ToString {
        return DiffUtils.diff(original, revised,  MyersDiff<T>())
    }

    /**
     * Computes the difference between the original and revised list of elements
     * with default diff algorithm
     * 
     * @param original The original text. 
     * @param revised The revised text.
     * @return The patch describing the difference between the original and revised sequences.
     * @param algorithm The diff algorithm.
     *   
     * @since 0.38.2
     */
    public static func diff<T>(original: ArrayList<T>, revised: ArrayList<T>,
            algorithm: DiffAlgorithm<T>): Patch<T> where T <: Equal<T> & ToString{
        return algorithm.diff(original, revised);
    }

    /**
     * Computes the difference between the original and revised list of elements
     * with default diff algorithm
     * 
     * @param original The original text. 
     * @param revised The revised text.
     * @return The patch describing the difference between the original and revised sequences.
     * @param equalizer the equalizer object to replace the default compare algorithm
     * 
     * @since 0.38.2
     */
    public static func diff<T>(original: ArrayList<T>, revised: ArrayList<T>,
            equalizer: Equalizer<T>): Patch<T> where T <: Equal<T> & ToString{
        return DiffUtils.diff(original, revised,MyersDiff<T>(equalizer))
    }
}