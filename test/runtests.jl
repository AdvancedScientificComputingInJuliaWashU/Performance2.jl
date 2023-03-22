using Performance2
using Test

@testset "Performance2.jl" begin
    @test unique_2loops([1, 2, 2, 2, 3, 2]) == [1, 2, 3]
    @test unique_2loops(collect("abracadabra")) == ['a', 'b', 'r', 'c', 'd']

    @test sort(unique_set([1, 2, 2, 2, 3, 2])) == [1, 2, 3]
    @test sort(unique_set(collect("abracadabra"))) == ['a', 'b', 'c', 'd', 'r']
end
