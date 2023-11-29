// 3rd_party_lib:diffutils4cj/build/release/diffUtils4cj

from fuzz import fuzz.*
from diffUtils4cj import diffUtils4cj.*
from std import collection.*

public func fuzzFunc_DiffRow_setOldLine(dp:DataProvider):Int32 {
    let diffrow=DiffRow(Tag.INSERT,"diff old","diff new")
    try{
        diffrow.setOldLine(dp.consumeString(1024))
    }catch(e:Exception){}
    return 0
}
main(){
    Fuzzer(fuzzFunc_DiffRow_setOldLine).startFuzz()
}