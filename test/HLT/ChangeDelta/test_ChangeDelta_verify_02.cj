// 3rd_party_lib:diffutils4cj/build/diffUtils4cj
// 3rd_party_lib_ohos:diffutils4cj/build/aarch64-linux-ohos/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestChangeDeltaV002{
    /***
        public init(original: Chunk<T>, revised: Chunk<T> )
        public func verify(target: ArrayList<T>): Unit
        测试场景:original.verify(target)正常，但getOriginal().getPosition() > target.size()，抛异常
    ***/
    @TestCase
    func testChangeDeltaVerify02(): Unit {
        var lines_arrlist=ArrayList<Char>()
        var original=Chunk(123,lines_arrlist)
        var revised=Chunk(123,lines_arrlist)
        let ChangeDelta=ChangeDelta(original,revised)
        var target=ArrayList<Char>(Array<Char>(122,item:'c'))
        var flag=1
        try{
            ChangeDelta.verify(target)
        }catch(e:PatchFailedException){
            if(e.toString().contains("Incorrect patch for delta: delta original position > target size")){
                flag=0
            }
        }
        @Assert(flag,0)
    }
}