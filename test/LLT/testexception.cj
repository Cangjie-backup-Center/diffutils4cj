// EXEC: cjc %import-path %L %l %f
// EXEC: ./main

from diffUtils4cj import diffUtils4cj.*
from std import collection.*

main(): Int64 {
    try {
        throw(DifferentiationFailedException("ok"))
    } catch(e: DifferentiationFailedException) {
        if(e.message == "ok") {
            return 0
        }
        return 1
    }
}