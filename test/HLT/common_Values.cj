// 3rd_party_lib:diffutils4cj/build/diffUtils4cj

from diffUtils4cj import diffUtils4cj.*

public class SubEqualizer01<T> <:Equalizer<T> where T <: Equal<T>{
    public func equals(original: T, revised: T): Bool{
        return original==revised
    }
}
public class SubEqualizer02<T> <:Equalizer<T> where T <: Equal<T>{
    public func equals(original: T, revised: T): Bool{
        return !(original==revised)
    }
}