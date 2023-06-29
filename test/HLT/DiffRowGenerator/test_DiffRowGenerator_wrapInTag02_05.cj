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
        测试场景:列表不为空,cssClass非为Option<String>.None
    ***/
    @TestCase
    func testDiffRowGeneratorWrapInTag0205(): Unit {
        let sequence=ArrayList<String>(["1","2","3","4","5"])
        let startPosition=0
        let endPosition=sequence.size
        let tag="tag"
        let cssClass=Option<String>.Some("cssClass")
        var re_wrapInTag=DiffRowGenerator.wrapInTag(sequence,startPosition,endPosition,tag,cssClass)
        let exp_startTag="<${tag} class=\"${cssClass.getOrThrow()}\">"
        let exp_endTag="</${tag}>"
        var exp_wrapInTag=ArrayList<String>(["1","2","3","4","5"])
        exp_wrapInTag.insert(startPosition,exp_startTag)
        exp_wrapInTag.insert(endPosition,exp_endTag)
        @Assert(re_wrapInTag,exp_wrapInTag)
    }
}