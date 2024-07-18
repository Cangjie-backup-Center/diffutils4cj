// 3rd_party_lib:diffutils4cj/build/release/diffUtils4cj
// 3rd_party_lib_ohos:diffutils4cj/build/aarch64-linux-ohos/diffUtils4cj

import std.unittest.*
import std.unittest.testmacro.*
import std.collection.*
import diffUtils4cj.*

@Test
public class TestDeltaComparatorB001{
    /***
        public func deltaComparator(a:Delta<T>,b:Delta<T>): Ordering
        测试场景:返回值角度验证场景
    ***/
    @TestCase
    func testDeltaComparatorDeltaComparator01(): Unit {
        var deltaComparator=DeltaComparator<Int64>()
        var chunk01=Chunk(123,ArrayList<Int64>([1,2,3,4,5,6]))
        var chunk02=Chunk(123,Array<Int64>([1,2,3,4,5,6]))
        var chunk03=Chunk(1234,Array<Int64>([1,2,3,4,5,6]))
        let changeDelta=ChangeDelta(chunk03,chunk01)
        let insertDelta=InsertDelta(chunk01,chunk02)
        let deleteDelta=DeleteDelta(chunk02,chunk03)
        @Assert(deltaComparator.deltaComparator(changeDelta,insertDelta),Ordering.GT)
        @Assert(deltaComparator.deltaComparator(insertDelta,changeDelta),Ordering.LT)
        @Assert(deltaComparator.deltaComparator(insertDelta,deleteDelta),Ordering.EQ)
    }
}