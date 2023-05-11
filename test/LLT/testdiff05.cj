// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from diffUtils4cj import diffUtils4cj.*
from std import collection.*

main(): Int64 {
    var patch:  Patch<String>= DiffUtils.diff(ArrayList<String>(), ArrayList<String>())
    if (patch.getDeltas().isEmpty()) {
        return 0
    }
    return 0
}