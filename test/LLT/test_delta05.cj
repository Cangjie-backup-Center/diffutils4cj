// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from diffUtils4cj import diffUtils4cj.*
from std import collection.*

main(): Int64 {
    var original: Chunk<String> = Chunk<String>(1, ["test"])
    var revised: Chunk<String> = Chunk<String>(0, ["test2"])
    var delta = InsertDelta<String>(original, revised)
    var newRevised: Chunk<String> = Chunk<String>(5, ["new", "revised"])
    delta.setRevised(newRevised)
    if (delta.getRevised().equals(newRevised)) {
        return 0
    }
    return 1
}