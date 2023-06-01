// 3rd_party_lib:diffutils4cj/build/diffUtils4cj
// dependence: ../common_Values.cj
from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestMyersDiffB001{
    /***
        public func diff(original: ArrayList<T>, revised: ArrayList<T>): Patch<T>
        public init(equalizer: Equalizer<T>)
        public init()
        测试场景:original==revised,均不为空
    ***/
    public var arrlist=ArrayList<String>(["value01","value01","value01","value01","value01","value01","value01"])
    @TestCase
    func testMyersDiffMyersDiff0221(): Unit {
        var myersDiff01=MyersDiff<String>()
        var pathch01=myersDiff01.diff(arrlist,arrlist)
        @Assert(pathch01.getDeltas().size,0)
    }
    @TestCase
    func testMyersDiffMyersDiff0222(): Unit {
        var myersDiff02=MyersDiff<String>(SubEqualizer01<String>())
        var pathch02=myersDiff02.diff(arrlist,arrlist)
        @Assert(pathch02.getDeltas().size,0)
    }
}