// 3rd_party_lib:diffutils4cj/build/diffUtils4cj
// 3rd_party_lib_ohos:diffutils4cj/build/aarch64-linux-ohos/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestPathNodeB001{
    /***
        public func toString(): String
        测试场景:当前pathNode下一级节点为None
    ***/
    @TestCase
    func testPathNodeToString01(): Unit {
        var pathNode01=Snake(1,1,Option<PathNode>.None)
        @Assert(pathNode01.toString(),"[(1,1)]")
    }
}