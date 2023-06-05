// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestDiffUtilsB001{
    /***
        public static func diff<T>( original: ArrayList<T>, revised: ArrayList<T>): Patch<T> where T <: Equal<T> & ToString
        测试场景:original==revised,均为空
    ***/
    @TestCase
    func testDiffUtilsDiff111(): Unit {
        var arr=ArrayList<String>()
        var pathch01=DiffUtils.diff(arr,arr)
        @Assert(pathch01.getDeltas().size,0)
    }
}