// 3rd_party_lib:diffutils4cj/build/release/diffUtils4cj

from fuzz import fuzz.*
from diffUtils4cj import diffUtils4cj.*
from std import collection.*

public func fuzzFunc_Builder_ignoreWhiteSpaces(dp:DataProvider):Int32 {
    let builder=Builder()
    try{
        builder.ignoreWhiteSpaces(dp.consumeBool())
    }catch(e:Exception){}
    return 0
}
main(){
    Fuzzer(fuzzFunc_Builder_ignoreWhiteSpaces).startFuzz()
}