// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestInsertDeltaV002{
    /***
        public init(original: Chunk<T>, revised: Chunk<T> )
        public func applyTo(target: ArrayList<T>): Unit
        测试场景:verify结果正常(original.getPosition()=<target.size)
                target.size=0 && revised.size!=0
    ***/
    @TestCase
    func testInsertDeltaApplyTo05(): Unit {
        var original=Chunk(0,ArrayList<Int64>([1,2,3,4,5,6]))
        var revised=Chunk(-1,Array<Int64>([7,8,9,10,11,12]))
        let insertDelta=InsertDelta(original,revised)
        var target=ArrayList<Int64>()
        insertDelta.applyTo(target)
        let target_exp=ArrayList<Int64>([7,8,9,10,11,12])
        @Assert(target,target_exp)
    }
}