using ConfigEnv
using PolygonIO
using TypedTables
using Test


dotenv()

const API_KEY = ENV["API_KEY"]

@testset "PolygonIO.jl" begin
    # Write your tests here.
    @test tickers(PolyOpts(API_KEY, Table), "bitcoin") |> size == (10, )
    @test tickers(PolyOpts(API_KEY, nothing), "bitcoin") |> size == (10, )
end
