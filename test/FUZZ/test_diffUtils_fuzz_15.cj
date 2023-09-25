// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from fuzz import fuzz.*
from diffUtils4cj import diffUtils4cj.*
from std import collection.*
from std import collection.*

public func fuzzFunc_DiffUtils_generateUnifiedDiff(dp:DataProvider):Int32 {
    try{
        DiffUtils.generateUnifiedDiff(dp.consumeString(1024),dp.consumeString(1024),ArrayList<String>(),Patch<String>(),dp.consumeInt64())
    }catch(e:Exception){}
    return 0
}

main(){
    Fuzzer(fuzzFunc_DiffUtils_generateUnifiedDiff).startFuzz()
}