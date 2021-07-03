tickers_base_url = "https://api.polygon.io/v3/reference/tickers"

ticker_types_base_url = "https://api.polygon.io/v2/reference/types"

ticker_news_base_url = "https://api.polygon.io/v2/reference/news"

markets_base_url = "https://api.polygon.io/v2/reference/markets"

locales_base_url = "https://api.polygon.io/v2/reference/locales"

market_holidays_base_url = "https://api.polygon.io/v1/marketstatus/upcoming"

market_status_base_url = "https://api.polygon.io/v1/marketstatus/now"

stock_exchanges_base_url = "https://api.polygon.io/v1/meta/exchanges"

crypto_exchanges_base_url = "https://api.polygon.io/v1/meta/crypto-exchanges"

ticker_details_base_url = "https://api.polygon.io/v1/meta/symbols"

ticker_details_vX_base_url = "https://api.polygon.io/vX/reference/tickers"

stock_splits_base_url = "https://api.polygon.io/v2/reference/splits"

stock_dividends_base_url = "https://api.polygon.io/v2/reference/dividends"

stock_financials_base_url = "https://api.polygon.io/v2/reference/financials"

"""
"""
function generate_output_from_url(url, params, sink; results=true, json_to_array=false)
    request_json = HTTP.get(url, query=params).body |> JSON3.read

    if sink === nothing
        if results
            return request_json.results
        else
            return request_json
        end
    else
        if results
            if json_to_array
                return request_json.results |> x -> sink([x])
            else
                return request_json.results |> sink
            end
        else
            if json_to_array
                return request_json |> x -> sink([x])
            else
                return request_json |> sink
            end
        end
    end
end