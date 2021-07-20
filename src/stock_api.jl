############ Trades  ####################
"""
    stock_trades(opts::PolyOpts, ticker::AbstractString, date::AbstractString; limit=10, reverse=true, kwargs...)

Get stock trades for a given ticker symbol on a specified date.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * ticker::AbstractString: The ticker symbol we want trades for.
 * date::AbstractString: The date/day of the trades to retrieve in the format YYYY-MM-DD.
 * limit::Int: Limit the size of the response, max 50000 and default 10.
 * reverse::Boolean: Reverse the order of the results.
 * kwargs::Any: A list of additional arguments to pass to the Polygon IO API.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_trades(opts, "AAPL", "2017-01-01")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_ticks_stocks_trades__ticker___date__anchor for documentation on response attributes and supported keyword arguments.
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
    stock_quotes_nbbo(opts::PolyOpts, ticker::AbstractString, date::AbstractString; limit=10, reverse=true, kwargs...)

Get NBBO quotes for a given ticker symbol on a specified date.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * ticker::AbstractString: The ticker symbol we want quotes for.
 * date::AbstractString: The date/day of the quotes to retrieve in the format YYYY-MM-DD.
 * limit::Int: Limit the size of the response, max 50000 and default 10.
 * reverse::Bool: Reverse the order of the results.
 * kwargs::Any: A list of additional arguments to pass to the Polygon IO API.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_quotes_nbbo(opts, "AAPL", "2017-01-01")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_ticks_stocks_nbbo__ticker___date__anchor for documentation on response attributes and supported keyword arguments.

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
    stock_last_trade_symbol(opts::PolyOpts, stocksTicker::AbstractString)

Get the most recent trade for a given stock.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * stocksTicker::AbstractString: The ticker symbol of the stock/equity.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_last_trade_symbol(opts, "AAPL")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_last_trade__stocksTicker__anchor for documentation on response attributes and supported keyword arguments.
"""
function stock_last_trade_symbol(opts::PolyOpts, stocksTicker::AbstractString)
    stock_last_trade_url = "$stock_last_trade_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkYesResults(), stock_last_trade_url, params, opts.sink)
end


# ############ Last Quote For A Symbol v2  ####################
"""
    stock_last_quote_symbol(opts::PolyOpts, stocksTicker::AbstractString)

Get the most recent NBBO (Quote) tick for a given stock.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * stocksTicker::AbstractString: The ticker symbol of the stock/equity.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_last_quote_symbol(opts, "AAPL")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_last_nbbo__stocksTicker__anchor for documentation on response attributes and supported keyword arguments.
"""
function stock_last_quote_symbol(opts::PolyOpts, stocksTicker::AbstractString)
    stock_last_quote_url = "$stock_last_quote_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkYesResults(), stock_last_quote_url, params, opts.sink)
end


# ############ Daily Open/Close  ####################
"""
    stock_daily_open_close(opts::PolyOpts, stocksTicker::AbstractString, date::AbstractString; adjusted=true)

Get the open, close and afterhours prices of a stock symbol on a certain date.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * stocksTicker::AbstractString: The ticker symbol of the stock/equity.
 * date::AbstractString: The date of the requested open/close in the format YYYY-MM-DD.
 * adjusted::Bool: Whether or not the results are adjusted for splits. By default, results are adjusted.
    Set this to false to get results that are NOT adjusted for splits.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_daily_open_close(opts, "AAPL", "2017-01-01")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v1_open-close__stocksTicker___date__anchor for documentation on response attributes and supported keyword arguments.
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
    stock_grouped_daily_bars(opts::PolyOpts, date::AbstractString; adjusted=true)

Get the daily open, high, low, and close (OHLC) for the entire stocks/equities markets.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * date::AbstractString: The beginning date for the aggregate window.
 * adjusted::Bool: Whether or not the results are adjusted for splits. By default, results are adjusted.
    Set this to false to get results that are NOT adjusted for splits.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_grouped_daily_bars(opts, "2017-01-01")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_aggs_grouped_locale_us_market_stocks__date__anchor for documentation on response attributes and supported keyword arguments.
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
    stock_previous_close(opts::PolyOpts, stocksTicker::AbstractString; adjusted=true)

Get the previous day's open, high, low, and close (OHLC) for the specified stock ticker.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * stocksTicker::AbstractString: The ticker symbol of the stock/equity.
 * adjusted::Bool: Whether or not the results are adjusted for splits.
    By default, results are adjusted. Set this to false to get results that are NOT adjusted for splits.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_previous_close(opts, "AAPL")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_aggs_ticker__stocksTicker__prev_anchor for documentation on response attributes and supported keyword arguments.
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
    stock_aggregates_bars(opts::PolyOpts, stocksTicker::AbstractString;
                        multiplier=1, timespan="day", from="2020-10-14", to="2020-10-14",
                        adjusted=true, sort="asc", limit=120, kwargs...)

Get aggregate bars for a stock over a given date range in custom time window sizes.
For example, if timespan = ‘minute’ and multiplier = ‘5’ then 5-minute bars will be returned.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * stocksTicker::AbstractString: The ticker symbol of the stock/equity.
 * multiplier::Int: TThe size of the timespan multiplier.
 * timespan::AbstractString: The size of the time window.
 * from::AbstractString: The start of the aggregate time window.
 * to::AbstractString: The end of the aggregate time window.
 * adjusted::Bool: Whether or not the results are adjusted for splits.
    By default, results are adjusted. Set this to false to get results that are NOT adjusted for splits.
 * sort::AbstractString: Sort the results by timestamp. asc will return results in ascending order (oldest at the top),
    desc will return results in descending order (newest at the top).
 * limit::Int: Limits the number of base aggregates queried to create the aggregate results. Max 50000 and Default 120.
 * kwargs::AbstractString: Any additional arguments.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_aggregates_bars(opts, "AAPL", multiplier=5, timespan="minute", from="2017-01-01", to="2017-01-01")
```
# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_aggs_ticker__stocksTicker__range__multiplier___timespan___from___to__anchor for documentation on response attributes and supported keyword arguments.
"""
function stock_aggregates_bars(opts::PolyOpts, stocksTicker::AbstractString;
                            multiplier=1, timespan="day", from="2020-10-14", to="2020-10-14",
                            adjusted=true, sort="asc", limit=120, kwargs...)

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
    stock_snapshot_all_tickers(opts::PolyOpts, tickers::AbstractString)

Get the current minute, day, and previous day’s aggregate, as well as the last trade and quote for all traded stock symbols.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges. This can happen as early as 4am EST.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * tickers::AbstractString: A comma separated list of tickers to get snapshots for.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_snapshot(opts, "AAPL")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_snapshot_locale_us_markets_stocks_tickers_anchor for documentation on response attributes and supported keyword arguments.
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
    stock_snapshot_ticker(opts::PolyOpts, stocksTicker::AbstractString)

Get the current minute, day, and previous day’s aggregate, as well as the last trade and quote for a single traded stock ticker.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges. This can happen as early as 4am EST.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * stocksTicker::AbstractString: The ticker symbol of the stock/equity.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_snapshot_ticker(opts, "AAPL")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_snapshot_locale_us_markets_stocks_tickers__stocksTicker__anchor for documentation on response attributes and supported keyword arguments.

"""
function stock_snapshot_ticker(opts::PolyOpts, stocksTicker::AbstractString)
    stock_snapshot_ticker_url = "$stock_snapshot_ticker_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(NoSinkYesTicker(), stock_snapshot_ticker_url, params, opts.sink)
end


# ############ Snapshot - Gainers/Losers  ####################
"""
    stock_snapshot_gainers_losers(opts::PolyOpts, direction="losers")

Get the current top 20 gainers or losers of the day in stocks/equities markets.
Top gainers are those tickers whose price has increased by the highest percentage since the previous day's close.
Top losers are those tickers whose price has decreased by the highest percentage since the previous day's close.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * direction::AbstractString: The direction of the snapshot results to return. The direction can be "gainers" or "losers".

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_snapshot_gainers_losers(opts, "losers")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_snapshot_locale_us_markets_stocks__direction__anchor for documentation on response attributes and supported keyword arguments.
"""
function stock_snapshot_gainers_losers(opts::PolyOpts, direction="losers")
    stock_snapshot_gainers_losers_url = "$stock_snapshot_gainers_losers_base_url/$direction"
    params = Dict(
        "apiKey" => opts.api_key,
        "direction" => direction
    )

    return generate_output_from_url(NoSinkYesTickers(), stock_snapshot_gainers_losers_url, params, opts.sink)
end