// 3rd_party_lib:diffutils4cj/build/diffUtils4cj
// 3rd_party_lib_ohos:diffutils4cj/build/aarch64-linux-ohos/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestChunkB001{
    /***
        public func getLines(): ArrayList<T>
        public init(position: Int64, lines: ArrayList<T>)
        public init(position: Int64, lines: Array<T>)
        测试场景:与构造器一致即可
    ***/
    @TestCase
    func testChunkGetLines01(): Unit {
        var chunk01=Chunk(123,ArrayList<Int64>())
        var chunk02=Chunk(123,Array<Int64>())
        @Assert(chunk01.getLines(),ArrayList<Int64>())
        @Assert(chunk02.getLines(),ArrayList<Int64>())
    }
}