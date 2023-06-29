// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from diffUtils4cj import diffUtils4cj.*
from std import collection.*

@Test
public class TestDiffRowGenerator{
    /***
        public func generateDiffRows(original: ArrayList<String>, revised: ArrayList<String>, patch: Patch<String>): ArrayList<DiffRow>
        测试场景:patch没有delta,original,revised非空
    ***/
    @TestCase
    func testDiffRowGeneratorGenerateDiffRows0102(): Unit {
        let original=ArrayList<String>(["12","34","56","78"])
        let revised=ArrayList<String>(["910","911","912"])
        var patch=Patch<String>()
        var builder=Builder()
        let diffRowGenerator=builder.build()
        let re_generateDiffRows=diffRowGenerator.generateDiffRows(original,revised,patch).toString()
        var exp_generateDiffRows_tmp=ArrayList<DiffRow>()
        for (line in original){
            exp_generateDiffRows_tmp.append(DiffRow(Tag.EQUAL, line, line))
        }
        let exp_generateDiffRows=exp_generateDiffRows_tmp.toString()
        @Assert(re_generateDiffRows,exp_generateDiffRows)
    }
}