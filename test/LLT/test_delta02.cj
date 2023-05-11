// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from diffUtils4cj import diffUtils4cj.*
from std import collection.*

main(): Int64 {
    var original: Chunk<String> = Chunk<String>(12, ["test"])
    var revised: Chunk<String> = Chunk<String>(5, ["test2"])
    var delta = DeleteDelta<String>(original, revised)
    match(delta.getType()){
        case DeltaType.DELETE => return 0
        case _ => return 1
    }
}