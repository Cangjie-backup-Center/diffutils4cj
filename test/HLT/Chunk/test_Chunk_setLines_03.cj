// 3rd_party_lib:diffutils4cj/build/release/diffUtils4cj
// 3rd_party_lib_ohos:diffutils4cj/build/aarch64-linux-ohos/diffUtils4cj

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import diffUtils4cj.*

@Test
public class TestChunkB001{
    /***
        public func setLines(lines: ArrayList<T>): Unit
        public init(position: Int64, lines: ArrayList<T>)
        public init(position: Int64, lines: Array<T>)
        测试场景:初始化构造不为空，set为空
    ***/
    @TestCase
    func testChunkSetLines03(): Unit {
        var changedArrli=ArrayList<Int16>([1,2,3,4,5,6])
        var changedArray=Array<Int16>([1,2,3,4,5,6])
        var chunk01=Chunk(123,changedArrli)
        var chunk02=Chunk(123,changedArray)
        @Assert(chunk01.getLines(),changedArrli)
        @Assert(chunk02.getLines(),changedArrli)
        chunk01.setLines(ArrayList<Int16>())
        chunk02.setLines(ArrayList<Int16>())
        @Assert(chunk01.getLines(),ArrayList<Int16>())
        @Assert(chunk02.getLines(),ArrayList<Int16>())
    }
}