// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from fuzz import fuzz.*
from diffUtils4cj import diffUtils4cj.*
from std import collection.*

public func fuzzFunc_StringUtills_join(dp:DataProvider):Int32 {
    try{
        StringUtills.join<String>(Array<String>(1024,item:"dserw"),dp.consumeString(1024))
    }catch(e:Exception){}
    return 0
}

main(){
    Fuzzer(fuzzFunc_StringUtills_join).startFuzz()
}