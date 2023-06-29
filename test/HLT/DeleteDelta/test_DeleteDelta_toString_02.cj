// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestDeleteDeltaV002{
    /***
        public init(original: Chunk<T>, revised: Chunk<T> )
        public func toString(): String
        测试场景:修订后内容(即;revised)是否为空序列-否
    ***/
    @TestCase
    func testDeleteDeltaToString02(): Unit {
        var original=Chunk(123,ArrayList<Int64>([1,2,3,4,5,6]))
        var revised=Chunk(123,Array<Int64>([7,8,9,10,11,12]))
        let deleteDelta=DeleteDelta(original,revised)
        let re_act=deleteDelta.toString()
        let re_exp="[DeleteDelta, position: ${original.getPosition()}, lines: ${original.getLines()}]"
        @Assert(re_act,re_exp)
    }
}