// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestStringUtills{
    /***
        public static func wrapText(line: String, columnWidth: Int64): String
        测试场景:line.size>2*columnWidth
    ***/
    @TestCase
    func testStringUtillsWrapText0103(): Unit {
        let line="absffabsffabsffabsffabsffabsff"
        let columnWidth=4
        let re_wrapText=StringUtills.wrapText(line,columnWidth)
        let exp_wrapText="absf"+"<br>"+"fabs"+"<br>"+"ffab"+"<br>"+"sffa"+"<br>"+"bsff"+"<br>"+"absf"+"<br>"+"fabs"+"<br>"+"ff"
        @Assert(re_wrapText,exp_wrapText)
    }
}