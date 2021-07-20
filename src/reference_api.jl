############ Tickers  ####################
"""
tickers(opts::PolyOpts, search::AbstractString; active=true,
        sort="ticker", order="asc", limit=10, kwargs...)

Query all ticker symbols which are supported by Polygon.io. This API currently includes Stocks/Equities, Crypto, and Forex.

# Arguments
 * opts::PolyOpts - Polygon API options
 * search::AbstractString - Search string
 * active::Boolean - Filter by active/inactive tickers
 * sort::String - Sort by field
 * order::String - Sort order
 * limit::Integer - Limit results
 * kwargs::Dict - Additional query parameters

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> tickers(opts, "bitcoin")
```

# Returns
* A JSON3.Array or specified tabular representation of the JSON3.Array.
* See https://polygon.io/docs/get_v3_reference_tickers_anchor for documentation on response attributes and supported keyword arguments.
"""
function tickers(opts::PolyOpts, search::AbstractString;
                active=true, sort="ticker", order="asc", limit=10, kwargs...)

    params = Dict(
        "search" => search,
        "active" => active,
        "sort" => sort,
        "order" => order,
        "limit" => limit,
        "apiKey" => opts.api_key
    )
    # Extract kwargs and add to params
    merge!(params, Dict(kwargs))

    return generate_output_from_url(YesSinkYesResults(), tickers_base_url, params, opts.sink)


end

############ Ticker Types  ####################
"""
    ticker_types(opts::PolyOpts)

Get a mapping of ticker types to their descriptive names.

# Arguments
 * opts::PolyOpts - Polygon API options

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> ticker_types(opts)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_reference_types_anchor for documentation on response attributes and supported keyword arguments.
"""
function ticker_types(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(NoSinkYesResults(), ticker_types_base_url, params, opts.sink)
end

############ Tickers Details ####################
"""
    ticker_details(opts::PolyOpts, stocksTicker::AbstractString)

Get details for a ticker symbol's company/entity.
This provides a general overview of the entity with information such as name, sector, exchange, logo and similar companies.

# Arguments
 * opts::PolyOpts - Polygon API options
 * stocksTicker::AbstractString - Ticker symbol

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> ticker_details(opts, "AAPL")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_reference_ticker_details_anchor for documentation on response attributes and supported keyword arguments.
"""
function ticker_details(opts::PolyOpts, stocksTicker::AbstractString)
    params = Dict("apiKey" => opts.api_key)
    ticker_details_url = "$ticker_details_base_url/$stocksTicker/company"

    return generate_output_from_url(YesSinkNoResults(), ticker_details_url, params, opts.sink)
end


############ Ticker Details vX ####################
"""
    ticker_details_vX(opts::PolyOpts, ticker::AbstractString, date::AbstractString)

Get a single ticker supported by Polygon.io.
This response will have detailed information about the ticker and the company behind it.

# Arguments
 * opts::PolyOpts - Polygon API options
 * ticker::AbstractString - Ticker symbol
 * date::AbstractString - Date for which to get data

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> ticker_details_vX(opts, "AAPL", "2017-01-01")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_vX_reference_tickers__ticker__anchor for documentation on response attributes and supported keyword arguments.
"""
function ticker_details_vX(opts::PolyOpts, ticker::AbstractString, date::AbstractString)
    # TODO: Dispatch on proper Date type?
    ticker_details_vX_url = "$ticker_details_vX_base_url/$ticker"

    params = Dict(
        "apiKey" => opts.api_key,
        "date"   => date
    )

    return generate_output_from_url(YesSinkYesResults(), ticker_details_vX_url, params, opts.sink)
end


############ Ticker News  #######################
"""
    ticker_news(opts::PolyOpts, ticker::AbstractString;
                published_utc_gte="2021-04-26", limit=10,
                order="descending", sort="published_utc",kwargs...)

Get the most recent news articles relating to a stock ticker symbol, including a summary of the article and a link to the original source.

# Arguments
 * opts::PolyOpts - Polygon API options
 * ticker::AbstractString - Ticker symbol
 * published_utc_gte::AbstractString - Date to retrieve news from
 * limit::Integer - Limit results
 * order::String - Sort order
 * sort::String - Sort by field
 * kwargs::Dict - Additional query parameters

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> ticker_news(opts, "AAPL", limit=5)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_reference_news_anchor for documentation on response attributes and supported keyword arguments.
"""
function ticker_news(opts::PolyOpts, ticker::AbstractString;
                    published_utc_gte="2021-04-26", limit=10,
                    order="descending", sort="published_utc",kwargs...)

    params = Dict(
        "apiKey" => opts.api_key,
        "ticker" => ticker,
        "published_utc.gte" => published_utc_gte,
        "limit" => limit,
        "order" => order,
        "sort" => sort
    )
    # Extract kwargs and add to params
    merge!(params, Dict(kwargs))

    return generate_output_from_url(YesSinkYesResults(), ticker_news_base_url, params, opts.sink)

end


############ Markets  ####################
"""
    markets(opts::PolyOpts)

Get a list of markets that are currently supported by Polygon.io.

# Arguments
 * opts::PolyOpts - Polygon API options

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> markets(opts)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_reference_markets_anchor for documentation on response attributes and supported keyword arguments.

"""
function markets(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkYesResults(), markets_base_url, params, opts.sink)
end


############ Locales  ####################
"""
    locales(opts::PolyOpts)

Get a list of locales currently supported by Polygon.io.

# Arguments
 * opts::PolyOpts - Polygon API options

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> locales(opts)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_reference_locales_anchor for documentation on response attributes and supported keyword arguments.
"""
function locales(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkYesResults(), locales_base_url, params, opts.sink)
end


############ Stock Splits  ####################
"""
    stock_splits(opts::PolyOpts, stocksTicker::AbstractString)

Get a list of historical stock splits for a ticker symbol, including the execution and payment dates of the stock split, and the split ratio.

# Arguments
 * opts::PolyOpts - Polygon API options
 * stocksTicker::AbstractString - Ticker symbol

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_splits(opts, "AAPL")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_reference_splits__stocksTicker__anchor for documentation on response attributes and supported keyword arguments.
"""
function stock_splits(opts::PolyOpts, stocksTicker::AbstractString)
    stock_splits_url = "$stock_splits_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkYesResults(), stock_splits_url, params, opts.sink)
end


############ Stock Dividends  ####################
"""
    stock_dividends(opts::PolyOpts, stocksTicker::AbstractString)

Get a list of historical dividends for a stock, including the relevant dates and the amount of the dividend.

# Arguments
 * opts::PolyOpts - Polygon API options
 * stocksTicker::AbstractString - Ticker symbol

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_dividends(opts, "AAPL")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_reference_dividends__stocksTicker__anchor for documentation on response attributes and supported keyword arguments.
"""
function stock_dividends(opts::PolyOpts, stocksTicker::AbstractString)
    stock_dividends_url = "$stock_dividends_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkYesResults(), stock_dividends_url, params, opts.sink)
end


############ Stock Financials  ####################
"""
    stock_financials(opts::PolyOpts, stocksTicker::AbstractString; limit=5, kwargs...)

Get historical financial data for a stock ticker.

# Arguments
 * opts::PolyOpts - Polygon API options
 * stocksTicker::AbstractString - Ticker symbol
 * limit::Integer - Limit results
 * kwargs::Any: A list of additional arguments to pass to the Polygon IO API.

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_financials(opts, "AAPL", limit=5)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v2_reference_financials_anchor for documentation on response attributes and supported keyword arguments.
"""
function stock_financials(opts::PolyOpts, stocksTicker::AbstractString; limit=5, kwargs...)
    stock_financials_url = "$stock_financials_base_url/$stocksTicker"
    params = Dict(
        "apiKey" => opts.api_key,
        "limit" => limit
    )
    # Extract kwargs and add to params
    merge!(params, Dict(kwargs))

    return generate_output_from_url(YesSinkYesResults(), stock_financials_url, params, opts.sink)
end


############ Market Holidays  ####################
"""
    market_holidays(opts::PolyOpts)

Get upcoming market holidays and their open/close times.

# Arguments
 * opts::PolyOpts - Polygon API options

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> market_holidays(opts)
```
# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v1_marketstatus_upcoming_anchor for documentation on response attributes and supported keyword arguments.
"""
function market_holidays(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkNoResults(), market_holidays_base_url, params, opts.sink)
end


############ Market Status  ####################
"""
    market_status(opts::PolyOpts)

Get the current trading status of the exchanges and overall financial markets.

# Arguments
 * opts::PolyOpts - Polygon API options

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> market_status(opts)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v1_marketstatus_now_anchor for documentation on response attributes and supported keyword arguments.
"""
function market_status(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkNoResults(), market_status_base_url, params, opts.sink)
end


############ Stock Exchanges  ####################
"""
    stock_exchanges(opts::PolyOpts)

Get a list of stock exchanges which are supported by Polygon.io.

# Arguments
 * opts::PolyOpts - Polygon API options

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> stock_exchanges(opts)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v1_meta_exchanges_anchor for documentation on response attributes and supported keyword arguments.
"""
function stock_exchanges(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkNoResults(), stock_exchanges_base_url, params, opts.sink)
end


############ Condition Mappings  ####################
"""
    condition_mappings(opts::PolyOpts, tickertype="trades")

Get a unified numerical mapping for conditions on trades and quotes.
Each feed/exchange uses its own set of codes to identify conditions, so the same condition may have a different code depending on the originator of the data.
Polygon.io defines its own mapping to allow for uniformly identifying a condition across feeds/exchanges.

# Arguments
 * opts::PolyOpts - Polygon API options
 * tickertype::AbstractString - Type of ticker to get condition mappings for. Must be one of "trades" or "quotes".

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> condition_mappings(opts, "trades")
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v1_condition_mappings_anchor for documentation on response attributes and supported keyword arguments.
"""
function condition_mappings(opts::PolyOpts, tickertype="trades")
    condition_mappings_url = "$condition_mappings_base_url/$tickertype"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkNoResults(), condition_mappings_url, params, opts.sink)
end

############ Crypto Exchanges ####################
"""
    crypto_exchanges(opts::PolyOpts)

Get a list of cryptocurrency exchanges which are supported by Polygon.io.

# Arguments
 * opts::PolyOpts - Polygon API options

# Example
```julia-repl
julia> opts = PolyOpts(API_KEY, nothing)
julia> crypto_exchanges(opts)
```

# Returns
 * A JSON3.Array or specified tabular representation of the JSON3.Array.
 * See https://polygon.io/docs/get_v1_meta_crypto-exchanges_anchor for documentation on response attributes and supported keyword arguments.
"""
function crypto_exchanges(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkNoResults(), crypto_exchanges_base_url, params, opts.sink)
end