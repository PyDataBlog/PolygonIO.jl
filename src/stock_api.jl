############ Trades  ####################
"""
"""
function trades(opts::PolyOpts, ticker::String, date::String; limit=10, reverse=true, kwargs...)
    trades_url = "$trades_base_url/$ticker/$date"
    params = Dict(
        "apiKey" => opts.api_key,
        "limit" => limit,
        "reverse" => reverse
    )

    merge!(params, Dict(kwargs))
    return generate_output_from_url(trades_url, params, opts.sink; results=true)
end


############ Quotes  ####################
"""
"""
function quotes_nbbo(opts::PolyOpts, ticker::String, date::String; limit=10, reverse=true, kwargs...)
    trades_url = "$quotes_base_url/$ticker/$date"
    params = Dict(
        "apiKey" => opts.api_key,
        "limit" => limit,
        "reverse" => reverse
    )

    merge!(params, Dict(kwargs))

    return generate_output_from_url(trades_url, params, opts.sink; results=true)
end


# ############ Last Trade For A Symbol v2  ####################
"""
"""
function last_trade_symbol(opts::PolyOpts, stocksTicker::String)
    last_trade_url = "$last_trade_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(last_trade_url, params, opts.sink; results=true)
end


# ############ Last Quote For A Symbol v2  ####################
"""
"""
function last_quote_symbol(opts::PolyOpts, stocksTicker::String)
    last_quote_url = "$last_quote_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(last_quote_url, params, opts.sink; results=true)
end


# ############ Daily Open/Close  ####################
"""
"""
function daily_open_close(opts::PolyOpts, stocksTicker::String, date::String; adjusted=true)
    daily_open_close_url = "$daily_open_close_base_url/$stocksTicker/$date"
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
    )
    return generate_output_from_url(daily_open_close_url, params, opts.sink; results=false)
end


# ############ Grouped Daily (Bars)  ####################
"""
"""
function grouped_daily_bars(opts::PolyOpts, date::String; adjusted=true)
    grouped_daily_bars_url = "$grouped_daily_bars_base_url/$date"
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
    )
    return generate_output_from_url(grouped_daily_bars_url, params, nothing; results=true)
end


# ############ Previous Close  ####################
"""
"""
function previous_close(opts::PolyOpts, stocksTicker::String; adjusted=true)
    previous_close_url = "$previous_close_base_url/$stocksTicker/prev"
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
    )

    return generate_output_from_url(previous_close_url, params, opts.sink; results=true)
end


# ############ Aggregates (Bars)  ####################
"""
"""
function aggregates_bars(opts::PolyOpts,
                        stocksTicker::String;
                        multiplier=1,
                        timespan="day",
                        from="2020-10-14",
                        to="2020-10-14",
                        adjusted=true,
                        sort="asc",
                        limit=120,
                        kwargs...)

    aggregates_bars_url = "$aggregates_bars_base_url/$stocksTicker/range/$multiplier/$timespan/$from/$to"

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

    return generate_output_from_url(aggregates_bars_url, params, opts.sink; results=true)
end


# ############ Snapshot - All Tickers  ####################
"""
"""
function snapshot_all_tickers(opts::PolyOpts, tickers::String)
    snapshot_all_tickers_url = "$snapshot_all_tickers_base_url"

    params = Dict(
        "apiKey" => opts.api_key,
        "tickers" => tickers
    )

    return generate_output_from_url(snapshot_all_tickers_url, params, opts.sink; results=true)
end


# ############ Snapshot - Ticker  ####################
"""
"""
function snapshot_ticker(opts::PolyOpts, stocksTicker::String)
    snapshot_ticker_url = "$snapshot_ticker_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(snapshot_ticker_url, params, opts.sink; results=false)
end


# ############ Snapshot - Gainers/Losers  ####################
"""
"""
function snapshot_gainers_losers(opts::PolyOpts, direction="losers")
    snapshot_gainers_losers_url = "$snapshot_gainers_losers_base_url/$direction"
    params = Dict(
        "apiKey" => opts.api_key,
        "direction" => direction
    )

    return generate_output_from_url(snapshot_gainers_losers_url, params, opts.sink; results=false)
end