// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestChangeDeltaV002{
    /***
        public init(original: Chunk<T>, revised: Chunk<T> )
        public func restore(target: ArrayList<T>): Unit
        测试场景:revised.size()!=original.getlines().size!=0
                revised.size+revised.position < target.size
    ***/
    @TestCase
    func testChangeDeltaRestore03(): Unit {
        var original=Chunk(2,ArrayList<Int64>([1,2,3,4,5,6]))
        var revised=Chunk(3,Array<Int64>([7,8,9,10,11,12]))
        let changeDelta=ChangeDelta(original,revised)
        var target=ArrayList<Int64>([-7,-8,-9,-10,-11,-12,-13,-14,-14,-14,-14])
        changeDelta.restore(target)
        var exp_target=ArrayList<Int64>([-7,-8,-9,1,2,3,4,5,6,-14,-14])
        @Assert(target,exp_target)
    }
}