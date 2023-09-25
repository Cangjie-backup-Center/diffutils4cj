// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from fuzz import fuzz.*
from diffUtils4cj import diffUtils4cj.*
from std import collection.*
from std import collection.*

public func fuzzFunc_Snake_Init(dp:DataProvider):Int32 {
    try{
        Snake(dp.consumeInt64(),dp.consumeInt64(),Option<PathNode>.None)
    }catch(e:Exception){}
    return 0
}

main(){
    Fuzzer(fuzzFunc_Snake_Init).startFuzz()
}