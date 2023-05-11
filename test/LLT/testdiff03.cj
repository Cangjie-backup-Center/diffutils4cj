// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from diffUtils4cj import diffUtils4cj.*
from std import collection.*

main(): Int64 {
    var patch:  Patch<String>= DiffUtils.diff(ArrayList<String>("aaa", "bbb", "ccc"), ArrayList<String>("aaa", "zzz", "ccc"))
    if (patch.getDeltas().isEmpty()) {
        return 1
    }
    if (1 != patch.getDeltas().size) {
        return 1
    }
    var  delta = patch.getDeltas().get(0).getOrThrow()
    if (!(delta is ChangeDelta<String>)) {
        return 1
    }
    if(delta.getOriginal().getLines().getRawArray() != ["bbb"]) {
        return 1
    }
    if(delta.getRevised().getLines().getRawArray() != ["zzz"]) {
        return 1
    }
    return 0
}