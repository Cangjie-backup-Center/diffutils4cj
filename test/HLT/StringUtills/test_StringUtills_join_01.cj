// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestStringUtills{
    /***
        public static func join<T>(objs: Iterable<T>, delimiter: String): String where T <: ToString
        测试场景:序列为空/非空,delimiter为非空字符串
    ***/
    @TestCase
    func testStringUtillsJoin01(): Unit {
        let arr01=Array<Int64>()
        let re_join=StringUtills.join(arr01,";")
        @Assert(re_join,"")
    }
    @TestCase
    func testStringUtillsJoin02(): Unit {
        let arr02=Array<Int64>([0,2,3,4,5])
        let re_join=StringUtills.join(arr02,";")
        @Assert(re_join,"0;2;3;4;5")
    }
}