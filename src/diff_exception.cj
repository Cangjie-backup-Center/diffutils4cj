/*
 * @Copyright (c) Huawei Technologies Co., Ltd. 2023-2023. All rights reserved.
 */

package diffUtils4cj

/**
 * Base class for all exceptions emanating from this package.
 */
public open class DiffException <: Exception {
    
    private static let  serialVersionUID: Int64 = 1
    
    public init(msg: String) {
        super(msg);
    }
}
