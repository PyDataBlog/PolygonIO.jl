using Test: length
using ConfigEnv
using PolygonIO
using TypedTables
using Test


dotenv()

const API_KEY = ENV["API_KEY"]
const tabular_opts = PolyOpts(API_KEY, Table)
const regular_opts = PolyOpts(API_KEY, nothing)


@testset "PolygonIO.jl" begin
    # tickets test
    @test tickers(tabular_opts, "bitcoin") |> size == (10, )
    @test tickers(regular_opts, "bitcoin") |> size == (10, )

    # ticker_types test
    @test ticker_types(tabular_opts) |> length == 2
    @test ticker_types(regular_opts) |> length == 2

    @test ticker_details(tabular_opts, "AAPL") |> size == (1, )
    @test ticker_details(regular_opts, "AAPL") |> length == 28
end
