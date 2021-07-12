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
function apply_choice(::YesSinkYesTickers, x, sink)
    try
        return x.tickers |> jsontable |> sink
    catch
        return x.tickers |> x -> sink([x])
    end
end


"""
"""
function apply_choice(::YesSinkYesTickers, x, sink::Nothing)
    return apply_choice(NoSinkYesTickers(), x, sink)
end


"""
"""
function apply_choice(::NoSinkYesTicker, x, sink)
    return x.ticker
end


"""
"""
function apply_choice(::YesSinkYesLast, x, sink)
    return x.last |> x -> sink([x])
end


"""
"""
function apply_choice(::NoSinkYesLast, x, sink)
    return x.last
end


"""
"""
function apply_choice(::YesSinkYesLast, x, sink::Nothing)
    return apply_choice(NoSinkYesLast(), x, sink)
end


"""
"""
function apply_choice(::YesSinkYesTicker, x, sink)
    try
        return x.ticker |> jsontable |> sink
    catch
        return x.ticker |> x -> sink([x])
    end
end


"""
"""
function apply_choice(::YesSinkYesTicker, x, sink::Nothing)
    return x.ticker
end


"""
"""
function apply_choice(::NoSinkYesData, x, sink)
    return x.data
end


"""
"""
function apply_choice(::YesSinkYesData, x, sink)
    try
        return x.data |> jsontable |> sink
    catch
        return x.data |> x -> sink([x])
    end
end


"""
"""
function apply_choice(::YesSinkYesData, x, sink::Nothing)
    return apply_choice(NoSinkYesData(), x, sink)
end