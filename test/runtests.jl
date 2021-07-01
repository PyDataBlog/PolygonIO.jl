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

    # ticker_details test
    @test ticker_details(tabular_opts, "AAPL") |> size == (1, )
    @test ticker_details(regular_opts, "AAPL") |> length == 28

    # ticker_details_vX next version test
    @test ticker_details_vX(tabular_opts, "AAPL", "2019-07-31") |> size == (1, )
    @test ticker_details_vX(regular_opts, "AAPL", "2019-07-31") |> length == 19

    # ticker_news test
    @test ticker_news(tabular_opts, "AAPL") |> length == 10
    @test ticker_news(regular_opts, "AAPL") |> length == 10

    # markets test
    @test markets(regular_opts) |> length == 7
    @test markets(tabular_opts) |> size == (7,)

    # locales test
    @test locales(regular_opts) |> size == (19,)
    @test locales(tabular_opts) |> size == (19,)
end
