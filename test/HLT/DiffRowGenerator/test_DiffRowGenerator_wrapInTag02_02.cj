// 3rd_party_lib:diffutils4cj/build/diffUtils4cj
// 3rd_party_lib_ohos:diffutils4cj/build/aarch64-linux-ohos/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestDiffRowGenerator{
    /***
        public static func wrapInTag(sequence: ArrayList<String>, startPosition: Int64, endPosition: Int64,tag: String, cssClass: Option<String>): ArrayList<String>
        测试场景:列表不为空,cssClass为Option<String>.None,startPosition=sequence.size+1,endPosition=sequence.size+2
    ***/
    @TestCase
    func testDiffRowGeneratorWrapInTag0202(): Unit {
        let sequence=ArrayList<String>(["1","2","3","4","5"])
        let startPosition=sequence.size
        let endPosition=sequence.size+1
        let tag="tag"
        let cssClass=Option<String>.None
        let re_wrapInTag=DiffRowGenerator.wrapInTag(sequence,startPosition,endPosition,tag,cssClass)
        let exp_startTag="<${tag}>"
        let exp_endTag="</${tag}>"
        var exp_wrapInTag=sequence
        exp_wrapInTag.insert(startPosition,exp_startTag)
        exp_wrapInTag.insert(endPosition,exp_endTag)
        @Assert(re_wrapInTag,exp_wrapInTag)
    }
}