############ Tickers  ####################
"""
"""
function tickers(opts::PolyOpts,
                search::String;
                active=true,
                sort="ticker",
                order="asc",
                limit=10,
                kwargs...)

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

    request_json = HTTP.get(tickers_base_url, query=params).body |> JSON3.read

    if opts.sink === nothing
        return request_json.results
    else
        return request_json.results |> opts.sink
    end

end

############ Ticker Types  ####################
"""
"""
function ticker_types(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    request_json = HTTP.get(ticker_types_base_url, query=params).body |> JSON3.read

    return request_json.results
end

############ Tickers Details ####################
"""
"""
function ticker_details(opts::PolyOpts, stocksTicker::String)
    params = Dict("apiKey" => opts.api_key)
    ticker_details_base_url = "https://api.polygon.io/v1/meta/symbols/$stocksTicker/company"

    request_json = HTTP.get(ticker_details_base_url, query=params).body |> JSON3.read

    if opts.sink === nothing
        return request_json
    else
        return [request_json] |> opts.sink
    end
end

############ Ticker Details vX ####################
"""
"""
function ticker_details_vX(opts::PolyOpts, ticker::String, date::String)
    # TODO: Dispatch on proper Date type?
    ticker_details_vX_base_url = "https://api.polygon.io/vX/reference/tickers/$ticker"

    params = Dict(
        "apiKey" => opts.api_key,
        "date"   => date
    )

    request_json = HTTP.get(ticker_details_vX_base_url, query=params).body |> JSON3.read

    if opts.sink === nothing
        return request_json.results
    else
        return [request_json.results] |> opts.sink
    end
end

############ Ticker News  #######################
"""
"""
function ticker_news(opts::PolyOpts,
                    ticker::String;
                    published_utc_gte="2021-04-26",
                    limit=10,
                    order="descending",
                    sort="published_utc",
                    kwargs...)

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

    request_json = HTTP.get(ticker_new_base_url, query=params).body |> JSON3.read

    return request_json.results

end

############ Markets  ####################
"""
"""
function markets(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    request_json = HTTP.get(markets_base_url, query=params).body |> JSON3.read

    if opts.sink === nothing
        return request_json.results
    else
        return request_json.results |> opts.sink
    end
end


############ Locales  ####################
"""
"""
function locales(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    request_json = HTTP.get(locales_base_url, query=params).body |> JSON3.read

    if opts.sink === nothing
        return request_json.results
    else
        return request_json.results |> opts.sink
    end
end

############ Stock Splits  ####################
"""
"""
function stock_splits(opts::PolyOpts, stocksTicker::String)
    stock_splits_base_url = "https://api.polygon.io/v2/reference/splits/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)
    request_json = HTTP.get(stock_splits_base_url, query=params).body |> JSON3.read

    return request_json.results
end

############ Stock Dividends  ####################
"""
"""
function stock_dividends(opts::PolyOpts, stocksTicker::String)
    stock_dividends_base_url = "https://api.polygon.io/v2/reference/dividends/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    request_json = HTTP.get(stock_dividends_base_url, query=params).body |> JSON3.read

    if opts.sink === nothing
        return request_json.results
    else
        return request_json.results |> opts.sink
    end
end

############ Stock Financials  ####################
"""
"""
function stock_financials(opts::PolyOpts, stocksTicker::String; limit=5, kwargs...)
    stock_financials_base_url = "https://api.polygon.io/v2/reference/financials/$stocksTicker"
    params = Dict(
        "apiKey" => opts.api_key,
        "limit" => limit
    )
    # Extract kwargs and add to params
    merge!(params, Dict(kwargs))

    request_json = HTTP.get(stock_financials_base_url, query=params).body |> JSON3.read

    if opts.sink === nothing
        return request_json.results
    else
        return request_json.results |> opts.sink
    end
end

############ Market Holidays  ####################
"""
"""
function market_holidays(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    request_json = HTTP.get(market_holidays_base_url, query=params).body |> JSON3.read

    if opts.sink === nothing
        return request_json
    else
        return request_json |> opts.sink
    end
end

############ Market Status  ####################
"""
"""
function market_status(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    request_json = HTTP.get(market_status_base_url, query=params).body |> JSON3.read

    return request_json
end

############ Stock Exchanges  ####################
"""
"""
function stock_exchanges(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    request_json = HTTP.get(stock_exchanges_base_url, query=params).body |> JSON3.read

    return request_json
end

############ Condition Mappings  ####################
"""
"""
function condition_mappings(opts::PolyOpts, tickertype="trades")
    condition_mappings_base_url = "https://api.polygon.io/v1/meta/conditions/$tickertype"
    params = Dict("apiKey" => opts.api_key)

    request_json = HTTP.get(condition_mappings_base_url, query=params).body |> JSON3.read

    return request_json
end

############ Crypto Exchanges ####################
"""
"""
function crypto_exchanges(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    request_json = HTTP.get(crypto_exchanges_base_url, query=params).body |> JSON3.read

    if opts.sink === nothing
        return request_json
    else
        return request_json |> opts.sink
    end
end