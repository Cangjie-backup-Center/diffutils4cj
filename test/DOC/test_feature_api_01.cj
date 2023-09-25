// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from diffUtils4cj import diffUtils4cj.*
from std import collection.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    let ccc = Test_ReadMe01()
    ccc.execute()
    ccc.printResult()
    0
}
@Test
public class Test_ReadMe01 {
    @TestCase
    public func testReadMe01(): Unit {
		var patch:  Patch<String>= DiffUtils.diff(ArrayList<String>("hhh"), ArrayList<String>("hhh", "jjj", "kkk"))
		@Assert(patch.getDeltas().isEmpty(),false)
		@Assert(patch.getDeltas().size,1)

		var  delta = patch.getDeltas().get(0).getOrThrow()
		@Assert(delta is InsertDelta<String>, true)
        @Assert(delta.getOriginal().getLines().isEmpty(), true)
        @Assert(delta.getRevised().getLines().toArray().toString(), "[jjj, kkk]")
    }
}