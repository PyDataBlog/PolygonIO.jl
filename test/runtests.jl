using ConfigEnv
using PolygonIO
using Test


dotenv()

const API_KEY = ENV["API_KEY"]

@testset "PolygonIO.jl" begin
    # Write your tests here.
    @test tickers(PolyOpts(API_KEY, true), "bitcoin") |> size == (10, )
    @test tickers(PolyOpts(API_KEY, false), "bitcoin") |> size == (10, )
end
