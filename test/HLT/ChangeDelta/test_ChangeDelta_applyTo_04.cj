// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestChangeDeltaV002{
    /***
        public init(original: Chunk<T>, revised: Chunk<T> )
        public func applyTo(target: ArrayList<T>): Unit
        测试场景:verify结果正常(original.verify(target)正常)
                original.size()!=0且revise.getlines().size!=0
                original.size+position<target.size
    ***/
    @TestCase
    func testChangeDeltaApplyTo03(): Unit {
        var original=Chunk(2,ArrayList<Int64>([1,2,3,4,5,6]))
        var revised=Chunk(3,Array<Int64>([7,8,9,10,11,12]))
        let changeDelta=ChangeDelta(original,revised)
        var target=ArrayList<Int64>([-7,-8,1,2,3,4,5,6,-13,-14])
        changeDelta.applyTo(target)
        var exp_target=ArrayList<Int64>([-7,-8,7,8,9,10,11,12,-13,-14])
        @Assert(target,exp_target)
    }
}