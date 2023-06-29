// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestPatchV002{
    /***
        public init()
        public func applyTo(target: ArrayList<T>): ArrayList<T>
        测试场景:Patch中没有Delta,target非空
    ***/
    @TestCase
    func testPatchApplyTo02(): Unit {
        var patch=Patch<Int64>()
        var target=ArrayList<Int64>([1,2,3])
        let result=patch.applyTo(target)
        var exp_result=ArrayList<Int64>([1,2,3])
        @Assert(result,exp_result)
    }
}