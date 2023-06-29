// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from std import unittest.*
from std import unittest.testmacro.*
from diffUtils4cj import diffUtils4cj.*

@Test
public class TestStringUtills{
    /***
        public static func normalize(str: String): String
        测试场景:str不包含<,>,\t
    ***/
    @TestCase
    func testStringUtillsNormalize0102(): Unit {
        let str01="  abc d ef  "
        let exp_re=str01
        let re_normalize=StringUtills.normalize(str01)
        @Assert(re_normalize,exp_re)
    }

}