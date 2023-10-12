/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package diffUtils4cj

public class PatchFailedException <: DiffException {
    private static var serialVersionUID: Int64 = 1
    
    public init() {
        super("")
    }
    
    public init(msg: String) {
        super(msg)
    }

    public func toString(): String {
        return "PatchFailedException: " + message
    }
}