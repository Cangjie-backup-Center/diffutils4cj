// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from fuzz import fuzz.*
from diffUtils4cj import diffUtils4cj.*
from std import collection.*

public func fuzzFunc_DiffRowGenerator_wrapInTag02(dp:DataProvider):Int32 {
    try{
        DiffRowGenerator.wrapInTag(dp.consumeString(1024),dp.consumeString(1024),Option<String>.Some(dp.consumeString(1024)))
    }catch(e:Exception){}
    return 0
}

main(){
    Fuzzer(fuzzFunc_DiffRowGenerator_wrapInTag02).startFuzz()
}