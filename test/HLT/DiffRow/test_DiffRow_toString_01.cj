// 3rd_party_lib:diffutils4cj/build/release/diffUtils4cj
// 3rd_party_lib_ohos:diffutils4cj/build/aarch64-linux-ohos/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestDiffRow{
    /***
        public init(tag: Tag, oldLine: String, newLine: String)
        public func toString(): String
        测试场景:与构造器一致
    ***/
    @TestCase
    func testDiffRowToString01(): Unit {
        let diffRow01=DiffRow(Tag.INSERT,"oldLine","newLine")
        @Assert(diffRow01.toString(),"[${diffRow01.getTag()},${diffRow01.getOldLine()},${diffRow01.getNewLine()}]")
    }
}