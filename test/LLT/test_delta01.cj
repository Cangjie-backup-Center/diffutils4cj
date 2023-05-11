// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from diffUtils4cj import diffUtils4cj.*
from std import collection.*

main(): Int64 {
    var original: Chunk<String> = Chunk<String>(12, ["test"])
    var revised: Chunk<String> = Chunk<String>(55, ["test2"])
    var delta = ChangeDelta<String>(original, revised)
    match(delta.getType()){
        case DeltaType.CHANGE => return 0
        case _ => return 1
    }
}