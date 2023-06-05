// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from std import collection.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestChunkB001{
    /***
        public func verify(target: ArrayList<T>): Unit
        public init(position: Int64, lines: ArrayList<T>)
        public init(position: Int64, lines: Array<T>)
        测试场景:last()<target.size,lines不为空,存在一个target.get(position + i)!=lines.get(i)
    ***/
    @TestCase
    func testChunkVerify0302(): Unit {
        var target=ArrayList<Char>(Array<Char>(250,item:'c'))
        var lines_arrlist=ArrayList<Char>(Array<Char>(100,item:'a'))
        var lines_arr=Array<Char>(100,item:'a')
        var chunk01=Chunk(123,lines_arrlist)//last()=222,size=100
        var chunk02=Chunk(123,lines_arr)//last()=222,size=100
        var flag=0
        try{
            chunk01.verify(target)
        }catch(e:PatchFailedException){
            if(e.toString().contains("Incorrect Chunk: the chunk content doesn't match the target")){
                flag=1
            }
        }
        @Assert(flag,1)
        flag=0
        try{
            chunk02.verify(target)
        }catch(e:PatchFailedException){
            if(e.toString().contains("Incorrect Chunk: the chunk content doesn't match the target")){
                flag=1
            }
        }
        @Assert(flag,1)
    }
}