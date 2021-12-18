############ Historic Forex Ticks  ####################
"""
    historic_forex_ticks(opts::PolyOpts, from="AUD", to="USD", date="2020-10-14"; limit=100, kwargs...)

Get historic ticks for a forex currency pair.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * from: The "from" symbol of the currency pair. Example: For USD/JPY the from would be USD.
 * to: The "to" symbol of the currency pair. Example: For USD/JPY the to would be JPY.
 * date: The date/day of the historic ticks to retrieve.
 * limit: TLimit the size of the response, max 10000. Defualt 100.
 * kwargs: Additional parameters to pass to the Poly API.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> historic_forex_ticks(opts, "AUD", "AUD", "2020-10-14")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v1_historic_forex__from___to___date__anchor for documentation on response attributes and supported keyword arguments.
"""
function historic_forex_ticks(opts::PolyOpts, from="AUD", to="AUD", date="2020-10-14"; limit=100, kwargs...)
    params = Dict(
        "apiKey" => opts.api_key,
        "limit" => limit
        )

    merge!(params, Dict(kwargs))

    historic_forex_ticks_url = "$historic_forex_ticks_base_url/$from/$to/$date"
    return generate_output_from_url(YesSinkYesTicks(), historic_forex_ticks_url, params, opts.sink)
end


############ Real Time Currency Conversion  ####################
"""
    real_time_currency_conversion(opts::PolyOpts, from="AUD", to="USD"; amount=100, precision=2)

Get currency conversions using the latest market conversion rates.
Note than you can convert in both directions. For example USD to CAD or CAD to USD.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * from: The "from" symbol of the pair.
 * to: The "to" symbol of the pair.
 * amount: The amount to convert.
 * precision: The decimal precision of the conversion. Defaults to 2 which is 2 decimal places accuracy.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> real_time_currency_conversion(opts, "AUD", "USD"; amount=100, precision=2)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v1_conversion__from___to__anchor for documentation on response attributes and supported keyword arguments.
"""
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
"""
    last_quote_currency_pair(opts::PolyOpts, from="AUD", to="USD")

Get the last quote tick for a forex currency pair.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * from: The "from" symbol of the pair.
 * to: The "to" symbol of the pair.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> last_quote_currency_pair(opts, "AUD", "USD")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v1_last_quote_currencies__from___to__anchor for documentation on response attributes and supported keyword arguments.
"""
function last_quote_currency_pair(opts::PolyOpts, from="AUD", to="USD")
    params = Dict(
        "apiKey" => opts.api_key
        )
    last_quote_currency_pair_url = "$last_quote_currency_pair_base_url/$from/$to"
    return generate_output_from_url(YesSinkNoResults(), last_quote_currency_pair_url, params, opts.sink)
end


############ Forex Grouped Daily Bars  ####################
"""
    forex_grouped_daily_bars(opts::PolyOpts, date="2020-10-14"; adjusted=true)

Get the daily open, high, low, and close (OHLC) for the entire forex markets.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * date: The beginning date for the aggregate window.
 * adjusted: Whether or not the results are adjusted for splits.
    By default, results are adjusted. Set this to false to get results that are NOT adjusted for splits.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> forex_grouped_daily_bars(opts, "2020-10-14")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_aggs_grouped_locale_global_market_fx__date__anchor for documentation on response attributes and supported keyword arguments.
"""
function forex_grouped_daily_bars(opts::PolyOpts, date="2020-10-14"; adjusted=true)
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
        )
    forex_grouped_daily_bars_url = "$forex_grouped_daily_bars_base_url/$date"
    return generate_output_from_url(YesSinkYesResults(), forex_grouped_daily_bars_url, params, opts.sink)
end


############ Forex Previous Close  ####################
"""
    forex_previous_close(opts::PolyOpts, forexTicker="C:EURUSD"; adjusted=true)

Get the previous day's open, high, low, and close (OHLC) for the specified forex pair.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * forexTicker: The ticker symbol of the currency pair.
 * adjusted: Whether or not the results are adjusted for splits.
    By default, results are adjusted. Set this to false to get results that are NOT adjusted for splits.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> forex_previous_close(opts, "C:EURUSD")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_aggs_ticker__forexTicker__prev_anchor for documentation on response attributes and supported keyword arguments.
"""
function forex_previous_close(opts::PolyOpts, forexTicker="C:EURUSD"; adjusted=true)
    params = Dict(
        "apiKey" => opts.api_key,
        "adjusted" => adjusted
        )
    forex_previous_close_url = "$forex_previous_close_base_url/$forexTicker/prev"
    return generate_output_from_url(YesSinkYesResults(), forex_previous_close_url, params, opts.sink)
end


############ Forex Aggregates Bars  ####################
"""
    forex_aggregates_bars(opts::PolyOpts, forexTicker="C:EURUSD", multiplier=1, timespan="day", from="2020-10-14", to="2020-10-14";
                        adjusted=true, sort="asc", limit=120)

Get aggregate bars for a forex pair over a given date range in custom time window sizes.
For example, if timespan = ‘minute’ and multiplier = ‘5’ then 5-minute bars will be returned.


# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * forexTicker: The ticker symbol of the currency pair.
 * multiplier: The size of the timespan multiplier.
 * timespan: The size of the time window.
 * from: The start of the aggregate time window.
 * to: The end of the aggregate time window.
 * adjusted: Whether or not the results are adjusted for splits.
    By default, results are adjusted. Set this to false to get results that are NOT adjusted for splits.
 * sort: Sort the results by timestamp. asc will return results in ascending order (oldest at the top),
    desc will return results in descending order (newest at the top).
 * limit: Limits the number of base aggregates queried to create the aggregate results. Max 50000 and Default 120.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> forex_aggregates_bars(opts, "C:EURUSD", "5", "minute", "2020-10-14", "2020-10-14")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_aggs_ticker__forexTicker__range__multiplier___timespan___from___to__anchor for documentation on response attributes and supported keyword arguments.
"""
function forex_aggregates_bars(opts::PolyOpts, forexTicker="C:EURUSD", multiplier=1, timespan="day", from="2020-10-14", to="2020-10-14";
                            adjusted=true, sort="asc", limit=120)
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
"""
    forex_snapshot_ticker(opts::PolyOpts, forexTicker="C:EURUSD")

Get the current minute, day, and previous day’s aggregate, as well as the last trade and quote for a single traded currency symbol.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * forexTicker: The forex ticker.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> forex_snapshot_ticker(opts, "C:EURUSD")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_snapshot_locale_global_markets_forex_tickers__ticker__anchor for documentation on response attributes and supported keyword arguments.
"""
function forex_snapshot_ticker(opts::PolyOpts, forexTicker="C:EURUSD")
    params = Dict(
        "apiKey" => opts.api_key
        )
    forex_snapshot_ticker_url = "$forex_snapshot_ticker_base_url/$forexTicker"
    return generate_output_from_url(YesSinkYesTicker(), forex_snapshot_ticker_url, params, opts.sink)
end


############ Forex Snapshot All Tickers  ####################
"""
    forex_snapshot_all_tickers(opts::PolyOpts; kwargs...)

Get the current minute, day, and previous day’s aggregate, as well as the last trade and quote for all traded forex symbols.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges. This can happen as early as 4am EST.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * kwargs: The keyword arguments to pass to the PolyOpts.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> forex_snapshot_all_tickers(opts)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_snapshot_locale_global_markets_forex_tickers_anchor for documentation on response attributes and supported keyword arguments.
"""
function forex_snapshot_all_tickers(opts::PolyOpts; kwargs...)
    params = Dict(
        "apiKey" => opts.api_key
        )
    merge!(params, Dict(kwargs))
    forex_snapshot_all_tickers_url = "$forex_snapshot_all_tickers_base_url"
    return generate_output_from_url(YesSinkYesTickers(), forex_snapshot_all_tickers_url, params, opts.sink)
end


############ Forex Snapshot Gainers/Losers  ####################
"""
    forex_snapshot_gainers_losers(opts::PolyOpts, direction="gainers")

Get the current top 20 gainers or losers of the day in forex markets.
Top gainers are those tickers whose price has increased by the highest percentage since the previous day's close.
Top losers are those tickers whose price has decreased by the highest percentage since the previous day's close.
Note: Snapshot data is cleared at 12am EST and gets populated as data is received from the exchanges.

# Arguments
 * opts::PolyOpts: The PolyOpts object used to configure the request.
 * direction: The direction of the snapshot results to return. "gainers" or "losers".

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> forex_snapshot_gainers_losers(opts, "losers")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array
 * See https://polygon.io/docs/get_v2_snapshot_locale_global_markets_forex__direction__anchor for documentation on response attributes and supported keyword arguments.
"""
function forex_snapshot_gainers_losers(opts::PolyOpts, direction="gainers")
    params = Dict(
        "apiKey" => opts.api_key
        )
    forex_snapshot_gainers_losers_url = "$forex_snapshot_gainers_losers_base_url/$direction"
    return generate_output_from_url(YesSinkYesTickers(), forex_snapshot_gainers_losers_url, params, opts.sink)
end
