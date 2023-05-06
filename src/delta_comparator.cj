/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package diffUtils4cj

/**
 * Delta Comparator.
 */
public class DeltaComparator<T> where T <: Equal<T> & ToString {
    private static let serialVersionUID: Int64 = 1
    public static let  INSTANCE = DeltaComparator<T>()

    private init() {
    }

    /**
     * Returns the Ordering of delta
     *
     * @return the Ordering
     *
     * @since 0.38.2
     */
    public func deltaComparator(a:Delta<T>,b:Delta<T>): Ordering  {
        let posA = a.getOriginal().getPosition();
        let posB = b.getOriginal().getPosition();
        if (posA > posB) {
            return Ordering.GT
        } else if (posA < posB) {
            return Ordering.LT
        }
        return Ordering.EQ
    }
}