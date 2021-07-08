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

    return generate_output_from_url(YesSinkYesResults(), tickers_base_url, params, opts.sink)


end

############ Ticker Types  ####################
"""
"""
function ticker_types(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(NoSinkYesResults(), ticker_types_base_url, params, opts.sink)
end

############ Tickers Details ####################
"""
"""
function ticker_details(opts::PolyOpts, stocksTicker::String)
    params = Dict("apiKey" => opts.api_key)
    ticker_details_url = "$ticker_details_base_url/$stocksTicker/company"

    return generate_output_from_url(YesSinkNoResults(), ticker_details_url, params, opts.sink)
end

############ Ticker Details vX ####################
"""
"""
function ticker_details_vX(opts::PolyOpts, ticker::String, date::String)
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

    return generate_output_from_url(YesSinkYesResults(), ticker_news_base_url, params, opts.sink)

end

############ Markets  ####################
"""
"""
function markets(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkYesResults(), markets_base_url, params, opts.sink)
end


############ Locales  ####################
"""
"""
function locales(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkYesResults(), locales_base_url, params, opts.sink)
end

############ Stock Splits  ####################
"""
"""
function stock_splits(opts::PolyOpts, stocksTicker::String)
    stock_splits_url = "$stock_splits_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkYesResults(), stock_splits_url, params, opts.sink)
end

############ Stock Dividends  ####################
"""
"""
function stock_dividends(opts::PolyOpts, stocksTicker::String)
    stock_dividends_url = "$stock_dividends_base_url/$stocksTicker"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkYesResults(), stock_dividends_url, params, opts.sink)
end

############ Stock Financials  ####################
"""
"""
function stock_financials(opts::PolyOpts, stocksTicker::String; limit=5, kwargs...)
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
"""
function market_holidays(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkNoResults(), market_holidays_base_url, params, opts.sink)
end

############ Market Status  ####################
"""
"""
function market_status(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkNoResults(), market_status_base_url, params, opts.sink)
end

############ Stock Exchanges  ####################
"""
"""
function stock_exchanges(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkNoResults(), stock_exchanges_base_url, params, opts.sink)
end

############ Condition Mappings  ####################
"""
"""
function condition_mappings(opts::PolyOpts, tickertype="trades")
    condition_mappings_base_url = "https://api.polygon.io/v1/meta/conditions/$tickertype"
    params = Dict("apiKey" => opts.api_key)

    return generate_output_from_url(YesSinkNoResults(), condition_mappings_base_url, params, opts.sink)
end

############ Crypto Exchanges ####################
"""
"""
function crypto_exchanges(opts::PolyOpts)
    params = Dict("apiKey" => opts.api_key)
    return generate_output_from_url(YesSinkNoResults(), crypto_exchanges_base_url, params, opts.sink)
end