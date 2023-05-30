# diffutil4cj 库

### 介绍

该库可以逐行比对两个字符串的差异，并按行将差异按格式展示出来，提供补丁打包和添加功能，

文档和数据的对比需要先转换为字符串数组再使用该库进行逐行比对。

### 1 提供比对两组字符串之间差异的功能

前置条件：NA 

场景：
1. 该库可以逐行比对两个字符串的差异，并按行将差异展示出来，提供补丁打包和添加功能。文档和数据的对比需要先转换为字符串数组再使用该库进行逐行比对。

约束：NA

可靠性：NA

#### 1.1 对比两组字符串之间的差异

提供差异对比，可以自定义对比内容

##### 1.1.1 主要接口

```cangjie
public class DiffUtils {
    /*
     * 对比两个ArrayList的差异
     * 参数 original - 要处理的原数据
     * 参数 revised - 要对比的修订数据
     * 返回值 Patch<T> - 返回差异对象
     */
    public static func diff<T>( original: ArrayList<T>, revised: ArrayList<T>): Patch<T> where T <: Equal<T> & ToString

    /*
     * 对比两个ArrayList的差异
     * 参数 original - 要处理的原数据
     * 参数 revised - 要对比的修订数据
     * 参数 algorithm - 差异算法
     * 返回值 Patch<T> - 返回差异对象
     */
    public static func diff<T>(original: ArrayList<T>, revised: ArrayList<T>,algorithm: DiffAlgorithm<T>): Patch<T> where T <: Equal<T> & ToString
    
    /*
     * 对比两个ArrayList的差异
     * 参数 original - 要处理的原数据
     * 参数 revised - 要对比的修订数据
     * 参数 equalizer - 排序算法
     * 返回值 Patch<T> - 返回差异对象
     */
    public static func diff<T>(original: ArrayList<T>, revised: ArrayList<T>,equalizer: Equalizer<T>): Patch<T> where T <: Equal<T> & ToString
}

public class Patch<T> where T <: Equal<T> & ToString {
	/*
     * 添加一个差异
     * 参数 delta - 要添加的差异
     */
	public func addDelta(delta: Delta<T>): Unit
	
	/*
     * 获取差异列表
     * 返回值 ArrayList<Delta<T>> - 返回当前保存的差异列表
     */
	public func getDeltas(): ArrayList<Delta<T>>
}

public abstract class Delta<T> where T <: Equal<T> & ToString{
	/*
     * 默认构造
     * 参数 original - 原始文本受影响的部分
     * 参数 revised - 修订文本中受影响的部分
     */
	public init(original: Chunk<T>, revised: Chunk<T>)
	
	/*
     * 获取差异类型
     * 返回值 DeltaType - 差异类型
     */
	public func getType(): DeltaType
	
	/*
     * 获取该差异原始文本受影响的部分
     * 返回值 Chunk<T> - 返回差异信息对象
     */
	public func getOriginal(): Chunk<T>
	
	/*
     * 设置该差异原始文本受影响的部分
     * 参数 original - 原始文本受影响的部分
     */
	public func setOriginal(original: Chunk<T>): Unit
	
	/*
     * 获取该差异修订文本受影响的部分
     * 返回值 Chunk<T> - 返回差异信息对象
     */
	public func getRevised(): Chunk<T>
	
	/*
     * 设置该差异修订文本受影响的部分
     * 参数 original - 修订文本受影响的部分
     */
	public func setRevised(revised: Chunk<T>)
}

public enum DeltaType {
    /** 差异类型为更新 */
    | CHANGE
    /** 差异类型为删除 */
    | DELETE
    /** 差异类型为插入 */
    | INSERT
}

public class ChangeDelta<T> <:  Delta<T> where T <: Equal<T> & ToString{
	/*
     * 默认构造
     * 参数 original - 原始文本受影响的部分
     * 参数 revised - 修订文本中受影响的部分
     */
	public init(original: Chunk<T>, revised: Chunk<T>)
	
	/*
     * 获取差异类型
     * 返回值 DeltaType - 差异类型
     */
	public func getType(): DeltaType
}

public class DeleteDelta<T> <:  Delta<T> where T <: Equal<T> & ToString {
	/*
     * 默认构造
     * 参数 original - 原始文本受影响的部分
     * 参数 revised - 修订文本中受影响的部分
     */
	public init(original: Chunk<T>, revised: Chunk<T>)
	
	/*
     * 获取差异类型
     * 返回值 DeltaType - 差异类型
     */
	public func getType(): DeltaType
}

public class InsertDelta<T> <: Delta<T> where T <: Equal<T> & ToString {
	/*
     * 默认构造
     * 参数 original - 原始文本受影响的部分
     * 参数 revised - 修订文本中受影响的部分
     */
	public init(original: Chunk<T>, revised: Chunk<T>)
	
	/*
     * 获取差异类型
     * 返回值 DeltaType - 差异类型
     */
	public func getType(): DeltaType
}

public class Chunk<T> where T <: Equal<T> & ToString {
     /*
     * 构造函数
     * 参数 position - 差异位置
     * 参数 lines - 差异值
     */
    public init(position: Int64, lines: ArrayList<T>)

     /*
     * 构造函数
     * 参数 position - 差异位置
     * 参数 lines - 差异值
     */
    public init(position: Int64, lines: Array<T>)

	/*
     * 获取该差异位置
     * 返回值 Int64 - 差异位置
     */
    public func getPosition(): Int64 

	/*
     * 设置差异值
     * 参数 lines - 差异值
     */
    public func setLines(lines: ArrayList<T>): Unit

	/*
     * 获取差异值
     * 返回值 ArrayList<T> - 差异值
     */
    public func getLines(): ArrayList<T>

	/*
     * 获取差异值的大小
     * 返回值 Int64 - 差异值的大小
     */
    public func size(): Int64

    /*
     * 返回最后一个值的下标位置，即position值 + 差异值大小 - 1
     * 返回值 Int64 - 最后一个值的下标位置
     */
    public func last(): Int64

    	/*
     * 判断两个差异是否相同
     * 参数 obj - 一个 Chunk<T> 差异
     * 返回值 Bool - 是否相同
     */
    public func equals(obj: Chunk<T>): Bool

    	/*
     * 将差异转换成字符串
     * 参返回值 String - 转换成字符串
     */
    public func toString(): String

    	/*
     * 验证差异相对目标列表是否合法
     * 参数 target - 目标列表
     */
    public func verify(target: ArrayList<T>): Unit
}


public interface DiffAlgorithm<T> where T <: Equal<T> & ToString{
    /*
     * 对比两个Array的差异
     * 参数 original - 要处理的原数据
     * 参数 revised - 要对比的修订数据
     * 返回值 Patch<T> - 返回差异对象
     */
    func diff(original: Array<T>, revised: Array<T>): Patch<T>
    
    /*
     * 对比两个ArrayList的差异
     * 参数 original - 要处理的原数据
     * 参数 revised - 要对比的修订数据
     * 返回值 Patch<T>- 返回差异对象
     */
    func diff(original : ArrayList<T>, revised: ArrayList<T>): Patch<T>
}

public class MyersDiff<T> <: DiffAlgorithm<T> where T <: Equal<T> & ToString {
	/*
     * 默认构造
     */
    public init()
    
    /*
     * 指定对比函数的构造方法
     * 参数 equalizer - 值对比函数
     */
    public init(equalizer: Equalizer<T>)
    
    /*
     * 对比两个Array的差异
     * 参数 original - 要处理的原数据
     * 参数 revised - 要对比的修订数据
     * 返回值 Patch<T>- 返回差异对象
     */
    public func diff(original: Array<T>, revised: Array<T>): Patch<T>
    
    /*
     * 对比两个ArrayList的差异
     * 参数 original - 要处理的原数据
     * 参数 revised - 要对比的修订数据
     * 返回值 Patch<T> 返回差异对象
     */
    public func diff(original: ArrayList<T>, revised: ArrayList<T>): Patch<T>
    
    /*
     * 构建一个表示原始文本和修订文本之间的最短编辑路径的PathNode对象
     * 参数 original - 原始文本
     * 参数 revised - 修订文本
     * 返回值 PathNode - PathNode对象
     */
    public func buildPath(orig:  ArrayList<T>, rev:  ArrayList<T>): PathNode
    
    /*
     * 根据一个差异路径构建一个Patch对象
     * 参数 path - PathNode对象
     * 参数 orig - 原始文本的元素列表
     * 参数 rev - 修订文本的元素列表
     * 返回值 Patch<T> - 返回差异对象
     */
    public func buildRevision(path: PathNode, orig: ArrayList<T>, rev: ArrayList<T>): Patch<T>
}

public abstract class PathNode {
	/*
     * 构造函数
     * 参数 i - 新节点在原始文本中的位置
     * 参数 j - 新节点在修订文本中的位置
     * 参数 prev - 差异路径中的前一个节点
     */
    public init(i: Int64, j: Int64, prev: Option<PathNode>)
    
    /*
     * 判断该节点是否是 Snake 节点
     * 返回值 Bool - 返回 true 是 Snake，false 不是 Snake
     */
    public func isSnake(): Bool
    
    /*
     * 判断该节点是否是 Bootstrap
     * 返回值 Bool - 返回 true 是 Bootstrap，false 不是 Bootstrap
     */
    public func isBootstrap(): Bool
    
    /*
     * 跳过一系列的DiffNodes，直到找到一个Snake或bootstrap节点，或者到达路径的末尾
     * 返回值 Option<PathNode> - 返回一个节点
     */
    public func previousSnake(): Option<PathNode>
    
    /*
     * 转换成字符串
     * 返回值 String - 返回字符串
     */
    public func toString(): String
}

public class DiffNode <: PathNode {
	/*
     * 构造函数
     * 参数 i - 新节点在原始文本中的位置
     * 参数 j - 新节点在修订文本中的位置
     * 参数 prev - 差异路径中的前一个节点
     */
    public init(i: Int64, j: Int64, prev: Option<PathNode>)
    
    /*
     * 判断该节点是否是 Snake 节点
     * 返回值 Bool - 返回 true 是 Snake，false 不是 Snake
     */
    public func isSnake(): Bool
}

public  class Snake <: PathNode {
	/*
     * 构造函数
     * 参数 i - 新节点在原始文本中的位置
     * 参数 j - 新节点在修订文本中的位置
     * 参数 prev - 差异路径中的前一个节点
     */
    public init(i: Int64, j: Int64, prev: Option<PathNode>)
    
    /*
     * 判断该节点是否是 Snake 节点
     * 返回值 Bool - 返回 true 是 Snake，false 不是 Snake
     */
    public func isSnake(): Bool
}

public class DeltaComparator<T> where T <: Equal<T> & ToString {
	/*
     * 构造函数
     */
    public init()
    
    /*
     * 比较两个 Delta<T> 存储的差异位置的大小
     * 返回值 Ordering - 排序大小
     */
	public func deltaComparator(a:Delta<T>,b:Delta<T>): Ordering
}

public open class DiffException <: Exception {
     /*
     * 构造函数
     * 参数 msg - 异常信息
     */
     public init(msg: String)
}

public class DifferentiationFailedException <: DiffException {
    /*
     * 构造函数
     * 参数 msg - 异常信息
     */
     public init(msg: String)
}

public class PatchFailedException <: DiffException {
     /*
     * 默认构造函数
     */
     public init()

     /*
     * 构造函数
     * 参数 msg - 异常信息
     */
     public init(msg: String)
}
```

##### 1.1.2 示例

```cangjie
from diffUtils4cj import diffUtils4cj.*
from std import collection.*

main(): Int64 {
    var patch:  Patch<String>= DiffUtils.diff(ArrayList<String>("hhh"), ArrayList<String>("hhh", "jjj", "kkk"))
    if (patch.getDeltas().isEmpty()) { //Deltas非空，即存在差异
        return 1
    }
    if (1 != patch.getDeltas().size) { //差异个数为一
        return 1
    }
    var  delta = patch.getDeltas().get(0).getOrThrow()
    if (!(delta is InsertDelta<String>)) { //差异类型为插入
        return 1
    }
    if(!delta.getOriginal().getLines().isEmpty()) { //差异原始数据无变动部分
        return 1
    }
    if(delta.getRevised().getLines().getRawArray() != ["jjj", "kkk"]) { //修订数据改动为["jjj", "kkk"]
        return 1
    }
    return 0
}
```
