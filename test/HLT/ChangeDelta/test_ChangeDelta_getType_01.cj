// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestChangeDeltaB001{
    /***
        public init(original: Chunk<T>, revised: Chunk<T>)
        public func getType(): DeltaType
        测试场景:获取类型准确
    ***/
    @TestCase
    func testChangeDeltaGetType01(): Unit {
        var chunk01=Chunk(123,ArrayList<Int64>([1,2,3,4,5,6]))
        var chunk02=Chunk(123,Array<Int64>([1,2,3,4,5,6]))
        let changeDelta=ChangeDelta(chunk01,chunk02)
        var flag=1
        match(changeDelta.getType()){
            case DeltaType.CHANGE => flag=0
            case _ => flag=-1
        }
        @Assert(flag,0)
    }
}