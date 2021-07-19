############ Trades  ####################
"""
"""
function stock_trades(opts::PolyOpts, ticker::AbstractString, date::AbstractString; limit=10, reverse=true, kwargs...)
    stock_trades_url = "$stock_trades_base_url/$ticker/$date"
    params = Dict(
        "apiKey" => opts.api_key,
        "limit" => limit,
        "reverse" => reverse
    )

    merge!(params, Dict(kwargs))

    return generate_output_from_url(YesSinkYesResults(), stock_trades_url, params, opts.sink)
end


############ Quotes  ####################
"""
"""
function stock_quotes_nbbo(opts::PolyOpts, ticker::AbstractString, date::AbstractString; limit=10, reverse=true, kwargs...)
    stock_quotes_url = "$stock_quotes_base_url/$ticker/$date"
    params = Dict(
        "apiKey" => opts.api_key,
        "limit" => limit,
        "reverse" => reverse
    )

    merge!(params, Dict(kwargs))

    return generate_output_from_url(YesSinkYesResults(), stock_quotes_url, params, opts.sink)
end


# ############ Last Trade For A Symbol v2  ####################
"""
"""
function stock_last_trade_symbol(opts::PolyOpts, stocksTicker::AbstractString)
    stock_last_trade_url = "$stock_last_trade_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkYesResults(), stock_last_trade_url, params, opts.sink)
end


# ############ Last Quote For A Symbol v2  ####################
"""
"""
function stock_last_quote_symbol(opts::PolyOpts, stocksTicker::AbstractString)
    stock_last_quote_url = "$stock_last_quote_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkYesResults(), stock_last_quote_url, params, opts.sink)
end


# ############ Daily Open/Close  ####################
"""
"""
function stock_daily_open_close(opts::PolyOpts, stocksTicker::AbstractString, date::AbstractString; adjusted=true)
    stock_daily_open_close_url = "$stock_daily_open_close_base_url/$stocksTicker/$date"
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
    )

    return generate_output_from_url(YesSinkNoResults(), stock_daily_open_close_url, params, opts.sink)
end


# ############ Grouped Daily (Bars)  ####################
"""
"""
function stock_grouped_daily_bars(opts::PolyOpts, date::AbstractString; adjusted=true)
    stock_grouped_daily_bars_url = "$stock_grouped_daily_bars_base_url/$date"
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
    )

    return generate_output_from_url(YesSinkYesResults(), stock_grouped_daily_bars_url, params, opts.sink)
end


# ############ Previous Close  ####################
"""
"""
function stock_previous_close(opts::PolyOpts, stocksTicker::AbstractString; adjusted=true)
    stock_previous_close_url = "$stock_previous_close_base_url/$stocksTicker/prev"
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
    )

    return generate_output_from_url(YesSinkYesResults(), stock_previous_close_url, params, opts.sink)
end


# ############ Aggregates (Bars)  ####################
"""
"""
function stock_aggregates_bars(opts::PolyOpts,
                        stocksTicker::AbstractString;
                        multiplier=1,
                        timespan="day",
                        from="2020-10-14",
                        to="2020-10-14",
                        adjusted=true,
                        sort="asc",
                        limit=120,
                        kwargs...)

    stock_aggregates_bars_url = "$stock_aggregates_bars_base_url/$stocksTicker/range/$multiplier/$timespan/$from/$to"

    params = Dict(
        "apiKey" => opts.api_key,
        "multiplier" => multiplier,
        "timespan" => timespan,
        "from" => from,
        "to" => to,
        "adjusted" => adjusted,
        "sort" => sort,
        "limit" => limit
    )

    merge!(params, Dict(kwargs))

    return generate_output_from_url(YesSinkYesResults(), stock_aggregates_bars_url, params, opts.sink)

end


# ############ Snapshot - All Tickers  ####################
"""
"""
function stock_snapshot_all_tickers(opts::PolyOpts, tickers::AbstractString)
    stock_snapshot_all_tickers_url = "$stock_snapshot_all_tickers_base_url"

    params = Dict(
        "apiKey" => opts.api_key,
        "tickers" => tickers
    )

    return generate_output_from_url(NoSinkYesTickers(), stock_snapshot_all_tickers_url, params, opts.sink)
end


# ############ Snapshot - Ticker  ####################
"""
"""
function stock_snapshot_ticker(opts::PolyOpts, stocksTicker::AbstractString)
    stock_snapshot_ticker_url = "$stock_snapshot_ticker_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(NoSinkYesTicker(), stock_snapshot_ticker_url, params, opts.sink)
end


# ############ Snapshot - Gainers/Losers  ####################
"""
"""
function stock_snapshot_gainers_losers(opts::PolyOpts, direction="losers")
    stock_snapshot_gainers_losers_url = "$stock_snapshot_gainers_losers_base_url/$direction"
    params = Dict(
        "apiKey" => opts.api_key,
        "direction" => direction
    )

    return generate_output_from_url(NoSinkYesTickers(), stock_snapshot_gainers_losers_url, params, opts.sink)
end