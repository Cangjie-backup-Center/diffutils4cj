// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestPathNodeB001{
    /***
        public func previousSnake(): Option<PathNode>
        测试场景:当前pathNode是bootstrap节点
    ***/
    @TestCase
    func testPathNodePreviousSnake01(): Unit {
        var snake01=Snake(-1,1,Option<PathNode>.None)
        var pathNode01=DiffNode(-1,1,Option<PathNode>.Some(snake01))
        @Assert(pathNode01.isBootstrap(),true)
        var flag=0
        try{
            pathNode01.previousSnake().getOrThrow()
        }catch(e:NoneValueException){
            flag=1
        }
        @Assert(flag,1)
    }
}