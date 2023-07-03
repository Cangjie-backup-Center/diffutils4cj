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
        public func restore(target: ArrayList<T>): Unit
        测试场景:revised.getPosition()<0
    ***/
    @TestCase
    func testChangeDeltaRestore03(): Unit {
        var original=Chunk(2,ArrayList<Int64>([1,2,3,4,5,6]))
        var revised=Chunk(-1,Array<Int64>([7,8,9,10,11,12]))
        let changeDelta=ChangeDelta(original,revised)
        var target=ArrayList<Int64>([-7,-8,-9,-10,-11,-12,-13,-14,-14,-14,-14])
        var flag=1
        try{
            changeDelta.restore(target)
        }catch(e:IndexOutOfBoundsException){
            flag=0
        }
        @Assert(flag,0)
    }
}