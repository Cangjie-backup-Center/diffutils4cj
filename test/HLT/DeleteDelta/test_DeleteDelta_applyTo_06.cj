// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestDeleteDeltaV002{
    /***
        public init(original: Chunk<T>, revised: Chunk<T> )
        public func applyTo(target: ArrayList<T>): Unit
        测试场景:verify结果正常(original.verify(target)正常)
                original.getPosition()+original.getOriginal().size < target.size
    ***/
    @TestCase
    func testDeleteDeltaApplyTo06(): Unit {
        var original=Chunk(1,ArrayList<Int64>([1,3]))
        var revised=Chunk(-1,Array<Int64>())
        let deleteDelta=DeleteDelta(original,revised)
        var target=ArrayList<Int64>([6,1,3,4])
        var exp_target=ArrayList<Int64>([6,4])
        deleteDelta.applyTo(target)
        @Assert(target,exp_target)
    }
}