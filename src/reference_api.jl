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

    base_url = "https://api.polygon.io/v3/reference/tickers"

    params = Dict(
        "search" => search,
        "active" => active,
        "sort" => sort,
        "order" => order,
        "limit" => limit,
        "apiKey" => opts.api_key
    )
    # Extract kwargs and add to params
    user_options = Dict(kwargs)
    merge!(params, user_options)

    request_json = HTTP.get(base_url, query=params).body |> JSON3.read

    while request_json.status == "OK"
        if opts.table
            return request_json.results |> Table
        else
            return request_json.results
        end
    end

end

############ Ticker Types  ####################


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