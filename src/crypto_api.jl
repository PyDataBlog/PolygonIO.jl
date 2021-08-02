############ Last Trade For A Crypto Pair  ####################
"""
    last_trade_crypto_pair(opts::PolyOpts, from="BTC", to="USD")

Get the last trade tick for a cryptocurrency pair.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * from: The "from" symbol of the pair.
 * to: The "to" symbol of the pair.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> last_trade_crypto_pair(opts, "BTC", "USD")
```

# Returns
* A JSON3.Array or specified tabular representation of the JSON3.Array.
* See https://polygon.io/docs/get_v1_last_crypto__from___to__anchor for documentation on response attributes and supported keyword arguments.
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
    crypto_daily_open_close(opts::PolyOpts, from="BTC", to="USD", date="2020-10-14"; adjusted=true)

Get the open, close prices of a cryptocurrency symbol on a certain day.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * from: The "from" symbol of the pair.
 * to: The "to" symbol of the pair.
 * date: The date of the requested open/close in the format YYYY-MM-DD.
 * adjusted: Whether or not the results are adjusted for splits.
   By default, results are adjusted. Set this to false to get results that are NOT adjusted for splits.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> crypto_daily_open_close(opts, "BTC", "USD", "2020-10-14")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v1_open-close_crypto__from___to___date__anchor for documentation on response attributes and supported keyword arguments.
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
    historic_crypto_trades(opts::PolyOpts, from="BTC", to="USD", date="2020-10-14"; limit=100, kwargs...)

Get historic trade ticks for a cryptocurrency pair.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * from: The "from" symbol of the crypto pair.
 * to: The "to" symbol of the crypto pair.
 * date: The date/day of the historic ticks to retrieve.
 * limit: Limit the size of the response, max 10000. Defaults to 100.
 * kwargs: Additional arguments to pass to the request.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> historic_crypto_trades(opts, "BTC", "USD", "2020-10-14")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v1_historic_crypto__from___to___date__anchor for documentation on response attributes and supported keyword arguments.
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
    crypto_grouped_daily_bars(opts::PolyOpts, date="2020-10-14"; adjusted=true)

Get the daily open, high, low, and close (OHLC) for the entire cryptocurrency markets.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * date: The beginning date for the aggregate window.
 * adjusted: Whether or not the results are adjusted for splits.
    By default, results are adjusted. Set this to false to get results that are NOT adjusted for splits.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> crypto_grouped_daily_bars(opts, "2020-10-14")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_aggs_grouped_locale_global_market_crypto__date__anchor for documentation on response attributes and supported keyword arguments.
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
    crypto_previous_close(opts::PolyOpts, cryptoTicker="X:BTCUSD"; adjusted=true)

Get the previous day's open, high, low, and close (OHLC) for the specified cryptocurrency pair.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * cryptoTicker: The ticker symbol of the currency pair.
 * adjusted: Whether or not the results are adjusted for splits.
    By default, results are adjusted. Set this to false to get results that are NOT adjusted for splits.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> crypto_previous_close(opts, "X:BTCUSD")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_aggs_ticker__cryptoTicker__prev_anchor for documentation on response attributes and supported keyword arguments.
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
    crypto_aggregates_bars(opts::PolyOpts, cryptoTicker="X:BTCUSD", multiplier=1, timespan="day", from="2020-10-14", to="2020-10-14";
                           adjusted=true, sort="asc", limit=120, kwargs...)

Get aggregate bars for a cryptocurrency pair over a given date range in custom time window sizes.
For example, if timespan = ‘minute’ and multiplier = ‘5’ then 5-minute bars will be returned.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * cryptoTicker: The ticker symbol of the currency pair.
 * multiplier: The size of the timespan multiplier.
 * timespan: The size of the timespan multiplier.
 * from: The start of the aggregate time window.
 * to: The end of the aggregate time window.
 * adjusted: Whether or not the results are adjusted for splits.
    By default, results are adjusted. Set this to false to get results that are NOT adjusted for splits.
 * sort: Sort the results by timestamp. asc will return results in ascending order (oldest at the top),
    desc will return results in descending order (newest at the top).
 * limit: Limits the number of base aggregates queried to create the aggregate results. Max 50000 and Default 120.
 * kwargs: Additional arguments to pass to the request.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> crypto_aggregates_bars(opts, "X:BTCUSD", 5, "minute", "2020-10-14", "2020-10-14")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_aggs_ticker__cryptoTicker__range__multiplier___timespan___from___to__anchor for documentation on response attributes and supported keyword arguments.
"""
function crypto_aggregates_bars(opts::PolyOpts, cryptoTicker="X:BTCUSD", multiplier=1, timespan="day", from="2020-10-14", to="2020-10-14";
                                adjusted=true, sort="asc", limit=120, kwargs...)
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
    crypto_snapshot_all_tickers(opts::PolyOpts; kwargs...)

Get the current minute, day, and previous day’s aggregate, as well as the last trade and quote for all traded cryptocurrency symbols.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges. This can happen as early as 4am EST.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * kwargs: Additional arguments to pass to the request.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> crypto_snapshot_all_tickers(opts)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_snapshot_locale_global_markets_crypto_tickers_anchor for documentation on response attributes and supported keyword arguments.
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
    crypto_snapshot_ticker(opts::PolyOpts, ticker="X:BTCUSD")

Get the current minute, day, and previous day’s aggregate, as well as the last trade and quote for a single traded cryptocurrency symbol.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges.


# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * ticker: Ticker of the snapshot.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> crypto_snapshot_ticker(opts, "X:BTCUSD")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_snapshot_locale_global_markets_crypto_tickers__ticker__anchor for documentation on response attributes and supported keyword arguments.
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
    crypto_snapshot_ticker_full_book(opts::PolyOpts, ticker="X:BTCUSD")

Get the current level 2 book of a single ticker. This is the combined book from all of the exchanges.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * ticker: The cryptocurrency ticker.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> crypto_snapshot_ticker_full_book(opts, "X:BTCUSD")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_snapshot_locale_global_markets_crypto_tickers__ticker__book_anchor for documentation on response attributes and supported keyword arguments.
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
    crypto_snapshot_gainers_losers(opts::PolyOpts, direction="gainers")


Get the current top 20 gainers or losers of the day in cryptocurrency markets.
Top gainers are those tickers whose price has increased by the highest percentage since the previous day's close.
Top losers are those tickers whose price has decreased by the highest percentage since the previous day's close.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * direction: The direction of the snapshot results to return. Options are "gainers" or "losers".

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> crypto_snapshot_gainers_losers(opts, "losers")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_snapshot_locale_global_markets_crypto__direction__anchor for documentation on response attributes and supported keyword arguments.
"""
function crypto_snapshot_gainers_losers(opts::PolyOpts, direction="gainers")
    params = Dict(
        "apiKey" => opts.api_key
        )
    crypto_snapshot_gainers_losers_url = "$crypto_snapshot_gainers_losers_base_url/$direction"
    return generate_output_from_url(YesSinkYesTickers(), crypto_snapshot_gainers_losers_url, params, opts.sink)
end