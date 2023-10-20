/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package diffUtils4cj

public class DifferentiationFailedException <: DiffException {
    private static let serialVersionUID: Int64 = 1

    public init(msg: String) {
        super(msg);
    }

    public func toString(): String {
        return "DifferentiationFailedException: " + message
    }
}
