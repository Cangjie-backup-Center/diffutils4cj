// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestChunkB001{
    /***
        public func getPosition(): Int64
        public init(position: Int64, lines: ArrayList<T>)
        public init(position: Int64, lines: Array<T>)
        测试场景:与构造器传入一致
    ***/
    @TestCase
    func testChunkGetPosition01(): Unit {
        var chunk01=Chunk(123,ArrayList<String>())
        var chunk02=Chunk(123,Array<String>())
        @Assert(chunk01.getPosition(),123)
        @Assert(chunk02.getPosition(),123)
    }
}