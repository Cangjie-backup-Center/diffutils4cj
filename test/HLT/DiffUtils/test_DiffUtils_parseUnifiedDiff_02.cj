// 3rd_party_lib:diffutils4cj/build/diffUtils4cj
// 3rd_party_lib_ohos:diffutils4cj/build/aarch64-linux-ohos/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestDiffUtilsV002{
    /***
        public static func parseUnifiedDiff(diff: ArrayList<String>): Patch<String>
        测试场景:入参数组非空，数组中值有无+++开头
    ***/
    @TestCase
    func testDiffUtilsParseUnifiedDiff01(): Unit {
        let diff=ArrayList<String>(["+++++adbad","darwggh"])
        let patch=DiffUtils.parseUnifiedDiff(diff)
        let deltas=patch.getDeltas()
        @Assert(deltas.size,0)
    }
    @TestCase
    func testDiffUtilsParseUnifiedDiff02(): Unit {
        let diff=ArrayList<String>(["adbad","+++darwggh"])
        let patch=DiffUtils.parseUnifiedDiff(diff)
        let deltas=patch.getDeltas()
        @Assert(deltas.size,0)
    }
    @TestCase
    func testDiffUtilsParseUnifiedDiff03(): Unit {
        let diff=ArrayList<String>(["adbad","darwggh"])
        let patch=DiffUtils.parseUnifiedDiff(diff)
        let deltas=patch.getDeltas()
        @Assert(deltas.size,0)
    }
    @TestCase
    func testDiffUtilsParseUnifiedDiff04(): Unit {
        let diff=ArrayList<String>(["adbad","darwggh"])
        let patch=DiffUtils.parseUnifiedDiff(diff)
        let deltas=patch.getDeltas()
        @Assert(deltas.size,0)
    }
}