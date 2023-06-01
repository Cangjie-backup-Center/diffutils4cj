// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestPathNodeB001{
    /***
        public func previousSnake(): Option<PathNode>
        测试场景:当前不是snake节点,不是bootstrap节点-当前节点的pre是Option.None
    ***/
    @TestCase
    func testPathNodePreviousSnake03(): Unit {
        var pathNode01=DiffNode(1,1,Option<PathNode>.None)
        @Assert(pathNode01.isBootstrap(),false)
        @Assert(pathNode01.isSnake(),false)
        var nodes=pathNode01.previousSnake().getOrThrow().toString()
        @Assert(nodes,"[(1,1)]")
    }
}