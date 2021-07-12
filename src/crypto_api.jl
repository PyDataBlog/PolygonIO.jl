############ Last Trade For A Crypto Pair  ####################
"""
"""
function last_trade_crypto_pair(opts::PolyOpts, from="BTC", to="USD")
    params = Dict(
        "apiKey" => opts.api_key,
        "from" => from,
        "to" => to
        )
    last_trade_crypto_pair_url = "$crypto_last_trade_pair_base_url/$from/$to"

    return generate_output_from_url(YesSinkYesLast(), last_trade_crypto_pair_url, params, opts.sink)
end


############################ Crypto Daily Open Close  ####################
"""
"""
function crypto_daily_open_close(opts::PolyOpts, from="BTC", to="USD", date="2020-10-14"; adjusted=true)
    params = Dict(
        "apiKey" => opts.api_key,
        "from" => from,
        "to" => to,
        "date" => date,
        "adjusted" => adjusted
    )
    crypto_daily_open_close_url = "$crypto_daily_open_close_base_url/$from/$to/$date"

    return generate_output_from_url(NoSinkNoResults(), crypto_daily_open_close_url, params, opts.sink)

end


############################ Historic Crypto Trades  ####################
"""
"""
function historic_crypto_trades(opts::PolyOpts, from="BTC", to="USD", date="2020-10-14"; limit=100, kwargs...)
    params = Dict(
        "apiKey" => opts.api_key,
        "from" => from,
        "to" => to,
        "date" => date,
        "limit" => limit
    )

    merge!(params, Dict(kwargs))
    historic_crypto_trades_url = "$crypto_historic_trades_base_url/$from/$to/$date"
    return generate_output_from_url(NoSinkNoResults(), historic_crypto_trades_url, params, opts.sink)
end


############################ Crypto Grouped Daily Bars  ####################
"""
"""
function crypto_grouped_daily_bars(opts::PolyOpts, date="2020-10-14"; adjusted=true)
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
        )

    crypto_grouped_daily_bars_url = "$crypto_grouped_daily_bars_base_url/$date"
    return generate_output_from_url(YesSinkYesResults(), crypto_grouped_daily_bars_url, params, opts.sink)
end


############################ Crypto Previous Close  ####################
"""
"""
function crypto_previous_close(opts::PolyOpts, cryptoTicker="X:BTCUSD"; adjusted=true)
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
        )

    crypto_previous_close_url = "$crypto_previous_close_base_url/$cryptoTicker/prev"
    return generate_output_from_url(YesSinkYesResults(), crypto_previous_close_url, params, opts.sink)
end


############################ Crypto Aggregate Bars  ####################
"""
"""
function crypto_aggregates_bars(opts::PolyOpts,
                                cryptoTicker="X:BTCUSD",
                                multiplier=1,
                                timespan="day",
                                from="2020-10-14",
                                to="2020-10-14";
                                adjusted=true,
                                sort="asc",
                                limit=120,
                                kwargs...)
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted,
        "from" => from,
        "to" => to,
        "sort" => sort,
        "limit" => limit
        )
    merge!(params, Dict(kwargs))
    crypto_aggregate_bars_url = "$crypto_aggregates_bars_base_url/$cryptoTicker/range/$multiplier/$timespan/$from/$to"
    return generate_output_from_url(YesSinkYesResults(), crypto_aggregate_bars_url, params, opts.sink)
end


############################ Crypto Snapshot All Tickers  ####################
"""
"""
function crypto_snapshot_all_tickers(opts::PolyOpts; kwargs...)
    params = Dict(
        "apiKey" => opts.api_key
        )
    merge!(params, Dict(kwargs))
    crypto_snapshot_all_tickers_url = "$crypto_snapshot_all_tickers_base_url"
    return generate_output_from_url(YesSinkYesTickers(), crypto_snapshot_all_tickers_url, params, opts.sink)
end


############################ Crypto Snapshot Ticker  ####################
"""
"""
function crypto_snapshot_ticker(opts::PolyOpts, ticker="X:BTCUSD")
    params = Dict(
        "apiKey" => opts.api_key
        )

    crypto_snapshot_ticker_url = "$crypto_snapshot_ticker_base_url/$ticker"
    return generate_output_from_url(YesSinkYesTicker(), crypto_snapshot_ticker_url, params, opts.sink)
end

############################ Crypto Snapshot Ticker Full Book  ####################
"""
"""
function crypto_snapshot_ticker_full_book(opts::PolyOpts, ticker="X:BTCUSD")
    params = Dict(
        "apiKey" => opts.api_key,
        )
    crypto_snapshot_ticker_full_book_url = "$crypto_snapshot_ticker_full_book_base_url/$ticker/book"
    return generate_output_from_url(YesSinkYesData(), crypto_snapshot_ticker_full_book_url, params, opts.sink)
end


############################ Crypto Snapshot Gainers/Losers  ####################
"""
"""
function crypto_snapshot_gainers_losers(opts::PolyOpts, direction="gainers")
    params = Dict(
        "apiKey" => opts.api_key
        )
    crypto_snapshot_gainers_losers_url = "$crypto_snapshot_gainers_losers_base_url/$direction"
    return generate_output_from_url(YesSinkYesTickers(), crypto_snapshot_gainers_losers_url, params, opts.sink)
end