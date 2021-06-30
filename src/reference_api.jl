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


############ Ticker News  #######################


############ Markets  ####################


############ Locales  ####################


############ Stock Splits  ####################


############ Stock Dividends  ####################


############ Stock Financials  ####################


############ Market Holidays  ####################


############ Market Status  ####################


############ Stock Exchanges  ####################


############ Condition Mappings  ####################


############ Crypto Exchanges ####################