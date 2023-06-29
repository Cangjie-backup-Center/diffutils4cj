// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestDiffRow{
    /***
        public init(tag: Tag, oldLine: String, newLine: String)
        public func getOldLine():String
        测试场景:与构造器一致
    ***/
    @TestCase
    func testDiffRowGetOldLine01(): Unit {
        let diffRow01=DiffRow(Tag.INSERT,"oldLine","newLine")
        @Assert(diffRow01.getOldLine(),"oldLine")
    }
}