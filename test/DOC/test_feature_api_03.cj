// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from diffUtils4cj import diffUtils4cj.*
from std import collection.*
from std import math.*
from std import unittest.*
from std import unittest.testmacro.*

main() {
    let ccc = Test_ReadMe03()
    ccc.execute()
    ccc.printResult()
    0
}
@Test
public class Test_ReadMe03 {
    @TestCase
    public func testReadMe01(): Unit {
		var first = "anything \n \nother\nmore lines"
		var second ="anything\n\nother\nsome more lines"
		var generator = Builder().ignoreWhiteSpaces(true).columnWidth(Int64.Max).build()
		var rows = generator.generateDiffRows(ArrayList<String>(first.split('\n')), ArrayList<String>(second.split('\n')))
			
		@Assert(rows.size,4)
		@Assert(rows.get(0).getOrThrow().getTag().toString(),"EQUAL")
		@Assert(rows.get(1).getOrThrow().getTag().toString(),"EQUAL")
        @Assert(rows.get(2).getOrThrow().getTag().toString(),"EQUAL")
        @Assert(rows.get(3).getOrThrow().getTag().toString(),"CHANGE")
    }
}