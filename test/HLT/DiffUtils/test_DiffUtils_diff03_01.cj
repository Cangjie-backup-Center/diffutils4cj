// 3rd_party_lib:diffutils4cj/build/diffUtils4cj
// 3rd_party_lib_ohos:diffutils4cj/build/aarch64-linux-ohos/diffUtils4cj
// dependence: ../common_Values.cj
from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestDiffUtilsB001{
    /***
        public static func diff<T>(original: ArrayList<T>, revised: ArrayList<T>,equalizer: Equalizer<T>): Patch<T> where T <: Equal<T> & ToString
        测试场景:original==revised,均为空
    ***/
    public var arrlist=ArrayList<String>()
    @TestCase
    func testDiffUtilsDiff311(): Unit {
        var subEqualizer01=SubEqualizer01<String>()
        var pathch01=DiffUtils.diff(arrlist,arrlist,subEqualizer01)
        @Assert(pathch01.getDeltas().size,0)
    }
    @TestCase
    func testDiffUtilsDiff312(): Unit {
        var subEqualizer02=SubEqualizer02<String>()
        var pathch02=DiffUtils.diff(arrlist,arrlist,subEqualizer02)
        @Assert(pathch02.getDeltas().size,0)
    }
}