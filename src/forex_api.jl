############ Historic Forex Ticks  ####################
function historic_forex_ticks(opts::PolyOpts, from="AUD", to="USD", date="2020-10-14"; limit=100, kwargs...)
    params = Dict(
        "apiKey" => opts.api_key,
        "limit" => limit
        )

    merge!(params, Dict(kwargs))

    historic_forex_ticks_url = "$historic_forex_ticks_base_url/$from/$to/$date"
    return generate_output_from_url(YesSinkYesTicks(), historic_forex_ticks_url, params, opts.sink)
end


############ Real Time Currency Conversion  ####################
function real_time_currency_conversion(opts::PolyOpts, from="AUD", to="USD"; amount=100, precision=2)
    params = Dict(
        "apiKey" => opts.api_key,
        "amount" => amount,
        "precision" => precision
        )
    real_time_currency_conversion_url = "$real_time_currency_conversion_base_url/$from/$to"
    return generate_output_from_url(YesSinkNoResults(), real_time_currency_conversion_url, params, opts.sink)
end


############ Last Quote Currency Pair  ####################
function last_quote_currency_pair(opts::PolyOpts, from="AUD", to="USD")
    params = Dict(
        "apiKey" => opts.api_key
        )
    last_quote_currency_pair_url = "$last_quote_currency_pair_base_url/$from/$to"
    return generate_output_from_url(YesSinkNoResults(), last_quote_currency_pair_url, params, opts.sink)
end


############ Forex Grouped Daily Bars  ####################
function forex_grouped_daily_bars(opts::PolyOpts, date="2020-10-14"; adjusted=true)
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
        )
    forex_grouped_daily_bars_url = "$forex_grouped_daily_bars_base_url/$date"
    return generate_output_from_url(YesSinkYesResults(), forex_grouped_daily_bars_url, params, opts.sink)
end


############ Forex Previous Close  ####################
function forex_previous_close(opts::PolyOpts, forexTicker="C:EURUSD"; adjusted=true)
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
        )
    forex_previous_close_url = "$forex_previous_close_base_url/$forexTicker/prev"
    return generate_output_from_url(YesSinkYesResults(), forex_previous_close_url, params, opts.sink)
end


############ Forex Aggregates Bars  ####################
function forex_aggregates_bars(opts::PolyOpts,
                               forexTicker="C:EURUSD",
                               multiplier=1,
                               timespan="day",
                               from="2020-10-14",
                               to="2020-10-14";
                               adjusted=true,
                               sort="asc",
                               limit=120)
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted,
        "sort" => sort,
        "limit" => limit
        )

    forex_aggregates_bars_url = "$forex_aggregates_bars_base_url/$forexTicker/range/$multiplier/$timespan/$from/$to"
    return generate_output_from_url(YesSinkYesResults(), forex_aggregates_bars_url, params, opts.sink)
end


############ Forex Snapshot Ticker  ####################
function forex_snapshot_ticker(opts::PolyOpts, forexTicker="C:EURUSD")
    params = Dict(
        "apiKey" => opts.api_key
        )
    forex_snapshot_ticker_url = "$forex_snapshot_ticker_base_url/$forexTicker"
    return generate_output_from_url(YesSinkYesTicker(), forex_snapshot_ticker_url, params, opts.sink)
end


############ Forex Snapshot All Tickers  ####################
function forex_snapshot_all_tickers(opts::PolyOpts; kwargs...)
    params = Dict(
        "apiKey" => opts.api_key
        )
    merge!(params, Dict(kwargs))
    forex_snapshot_all_tickers_url = "$forex_snapshot_all_tickers_base_url"
    return generate_output_from_url(YesSinkYesTickers(), forex_snapshot_all_tickers_url, params, opts.sink)
end


############ Forex Snapshot Gainers/Losers  ####################
function forex_snapshot_gainers_losers(opts::PolyOpts, direction="gainers")
    params = Dict(
        "apiKey" => opts.api_key
        )
    forex_snapshot_gainers_losers_url = "$forex_snapshot_gainers_losers_base_url/$direction"
    return generate_output_from_url(YesSinkYesTickers(), forex_snapshot_gainers_losers_url, params, opts.sink)
end
