// 3rd_party_lib:diffutils4cj/build/release/diffUtils4cj

from fuzz import fuzz.*
from diffUtils4cj import diffUtils4cj.*
from std import collection.*
from std import collection.*

public func fuzzFunc_Builder_InlineOldTag(dp:DataProvider):Int32 {
    let builder=Builder()
    try{
        builder.InlineOldTag(dp.consumeString(1024))
    }catch(e:Exception){}
    return 0
}
main(){
    Fuzzer(fuzzFunc_Builder_InlineOldTag).startFuzz()
}