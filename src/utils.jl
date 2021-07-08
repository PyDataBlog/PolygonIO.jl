"""
"""
function generate_output_from_url(url, params, sink; results=false)
    request_json = HTTP.get(url, query=params).body |> JSON3.read

    if sink === nothing
        if results
            return request_json.results
        else
            return request_json
        end
    else
        if results
            try
                return request_json.results |> jsontable |> sink
            catch
                return request_json.results |> x -> sink([x])
            end
        else
            try
                return request_json |> jsontable |> sink
            catch
                return request_json |> x -> sink([x])
            end
        end
    end
    return request_json

end


"""
"""
function generate_output_from_url(choice::AbstractPolyChoice, url, params, sink)
    request_json = HTTP.get(url, query=params).body |> JSON3.read

    return apply_choice(choice, request_json, sink)
end


"""
"""
function apply_choice(::NoSinkYesResults, x, sink)
    return x.results
end


"""
"""
function apply_choice(::NoSinkNoResults, x, sink)
    return x
end


"""
"""
function apply_choice(::YesSinkYesResults, x, sink)
    try
        return x.results |> jsontable |> sink
    catch
        return x.results |> x -> sink([x])
    end
end


"""
"""
function apply_choice(::YesSinkYesResults, x, sink::Nothing)
    return apply_choice(NoSinkYesResults(), x, sink)
end


"""
"""
function apply_choice(::YesSinkNoResults, x, sink)
    try
        return x |> jsontable |> sink
    catch
        return x |> x -> sink([x])
    end
end


"""
"""
function apply_choice(::YesSinkNoResults, x, sink::Nothing)
    return apply_choice(NoSinkNoResults(), x, sink)
end


"""
"""
function apply_choice(::NoSinkYesTickers, x, sink)
    return x.tickers
end


"""
"""
function apply_choice(::NoSinkYesTicker, x, sink)
    return x.ticker
end