############ Tickers  ####################
"""
"""
function tickers(opts::PolyOpts,
                search::String;
                active::Bool=true,
                sort::String="ticker",
                order::String="asc",
                limit::Int=10,
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

    if opts.sink ≠ nothing
        @warn "This endpoint does not support a tabular interface. Returning JSON instead of $(opts.sink)."
    end

    return request_json.results
end

############ Tickers Details ####################


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