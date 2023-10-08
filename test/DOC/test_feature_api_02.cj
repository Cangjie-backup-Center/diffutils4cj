// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from diffUtils4cj import diffUtils4cj.*
from std import collection.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    let ccc = Test_FeatureApi02()
    ccc.execute()
    ccc.printResult()
    0
}
@Test
public class Test_FeatureApi02 {
    @TestCase
    public func testFeatureApi02(): Unit {
		var rev = ArrayList<String>("hhh", "jjj", "kkk")
		var orig= ArrayList<String>()
		var patch:  Patch<String>= DiffUtils.diff(rev, orig)
		var res = DiffUtils.patch(rev,patch)
        @Assert(res == orig, true)
    }
}