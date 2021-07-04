using ConfigEnv
using PolygonIO
using TypedTables
using Test


dotenv()

const API_KEY = ENV["API_KEY"]
const tabular_opts = PolyOpts(API_KEY, Table)
const regular_opts = PolyOpts(API_KEY, nothing)


@testset "Reference API" begin
    # tickets test
    @test tickers(tabular_opts, "bitcoin") |> length == 10
    @test tickers(regular_opts, "bitcoin") |> length == 10

    # ticker_types test
    @test ticker_types(tabular_opts) |> length == 2
    @test ticker_types(regular_opts) |> length == 2

    # ticker_details test
    @test ticker_details(tabular_opts, "AAPL") |> length == 1
    @test ticker_details(regular_opts, "AAPL") |> length >= 28

    # ticker_details_vX next version test
    @test ticker_details_vX(tabular_opts, "AAPL", "2019-07-31") |> length == 1
    @test ticker_details_vX(regular_opts, "AAPL", "2019-07-31") |> length == 19

    # ticker_news test
    @test ticker_news(tabular_opts, "AAPL") |> length == 10
    @test ticker_news(regular_opts, "AAPL") |> length == 10

    # markets test
    @test markets(regular_opts) |> length >= 7
    @test markets(tabular_opts) |> length >= 7

    # locales test
    @test locales(regular_opts) |> length >= 19
    @test locales(tabular_opts) |> length >= 19

    # stock_splits test
    @test stock_splits(regular_opts, "AAPL") |> length >= 4
    @test stock_splits(tabular_opts, "AAPL") |> length >= 4

    # stock_dividends test
    @test stock_dividends(regular_opts, "AAPL") |> length >= 65
    @test stock_dividends(tabular_opts, "AAPL") |> length >= 65

    # stock_financials test
    @test stock_financials(regular_opts, "AAPL") |> length == 5
    @test stock_financials(tabular_opts, "AAPL") |> length == 5

    # market_holidays test
    @test market_holidays(regular_opts) |> length >= 1
    @test market_holidays(tabular_opts) |> length >= 1

    # market_status test
    @test market_status(regular_opts) |> length >= 6
    @test market_status(tabular_opts) |> length >= 6

    # stock_exchanges test
    @test stock_exchanges(regular_opts) |> length >= 30
    @test stock_exchanges(tabular_opts) |> length >= 30

    # condition_mappings test
    @test condition_mappings(regular_opts, "trades") |> length >= 1
    @test condition_mappings(tabular_opts, "quotes") |> length >= 1

    # stock_exchanges test
    @test crypto_exchanges(regular_opts) |> length >= 5
    @test crypto_exchanges(tabular_opts) |> length >= 5
end


@testset "Stock API" begin
    # trades test
    @test trades(tabular_opts, "AAPL", "2020-10-14") |> length == 10
    @test trades(regular_opts, "AAPL", "2020-10-14") |> length == 10

    # quotes_nbbo test
    @test quotes_nbbo(tabular_opts, "AAPL", "2020-10-14") |> length == 10
    @test quotes_nbbo(regular_opts, "AAPL", "2020-10-14") |> length == 10

    # last_trade_symbol test
    @test last_trade_symbol(tabular_opts, "AAPL") |> length == 1
    @test last_trade_symbol(regular_opts, "AAPL") |> length == 10

    # last_quote_symbol test
    @test last_quote_symbol(regular_opts, "AAPL") |> length >= 10
    @test last_quote_symbol(tabular_opts, "AAPL") |> length == 1

    # daily_open_close test
    @test daily_open_close(tabular_opts, "AAPL", "2020-10-14") |> length == 1
    @test daily_open_close(regular_opts, "AAPL", "2020-10-14") |> length >= 10

    # previous_close test
    @test previous_close(tabular_opts, "AAPL") |> length == 1
    @test previous_close(regular_opts, "AAPL") |> length == 1

    # aggregates_bars test
    @test aggregates_bars(tabular_opts, "AAPL") |> length == 1
    @test aggregates_bars(regular_opts, "AAPL") |> length == 1

    # snapshot_all_tickers test
    # @test snapshot_all_tickers(tabular_opts, "AAPL,AMZN")
    # @test snapshot_all_tickers(regular_opts, "AAPL,AMZN")

    # # snapshot_ticker test
    # @test snapshot_ticker(tabular_opts, "AAPL")
    # @test snapshot_ticker(regular_opts, "AAPL")

    # # snapshot_gainers_losers test
    # @test snapshot_gainers_losers(tabular_opts, "losers")
    # @test snapshot_gainers_losers(regular_opts, "gainers")
end