// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*


main(): Unit {
    var original=Chunk(123,ArrayList<Int64>([1,2,3,4,5,6]))
    var revised=Chunk(123,Array<Int64>([7,8,9,10,11,12]))
    let insertDelta=InsertDelta(original,revised)
    let re_act=insertDelta.toString()
    let re_exp="[InsertDelta, position: ${original.getPosition()}, lines: ${revised.getLines()}]"
    @Assert(re_act,re_exp)
}
