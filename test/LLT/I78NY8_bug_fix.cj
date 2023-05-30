// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

main(): Int64 {
    var diffNode01=DiffNode(1,1,Option<PathNode>.None)
    @Assert(diffNode01.isSnake(), false)
    return 0
}