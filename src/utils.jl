"""
    generate_output_from_url(choice::AbstractPolyChoice, url, params, sink)

Internal function to dynamically generate output from a user specified AbstractPolyChoice.
"""
function generate_output_from_url(choice::AbstractPolyChoice, url, params, sink)
    request_json = HTTP.get(url, query=params).body |> JSON3.read

    return apply_choice(choice, request_json, sink)
end


"""
    apply_choice(::NoSinkYesResults, x, sink)

Internal function to apply a choice for no sink and yes results scenarios.
"""
function apply_choice(::NoSinkYesResults, x, sink)
    return x.results
end


"""
    apply_choice(::NoSinkNoResults, x, sink)

Internal function to apply a choice for no sink and no results scenarios.
"""
function apply_choice(::NoSinkNoResults, x, sink)
    return x
end


"""
    apply_choice(::YesSinkYesResults, x, sink)

Internal function to apply a choice for yes sink and yes results scenarios.
"""
function apply_choice(::YesSinkYesResults, x, sink)
    try
        return x.results |> jsontable |> sink
    catch
        return x.results |> x -> sink([x])
    end
end


"""
    apply_choice(::YesSinkNoResults, x, sink)

Internal function to apply a choice for no sink and yes results scenarios.
"""
function apply_choice(::YesSinkYesResults, x, sink::Nothing)
    return apply_choice(NoSinkYesResults(), x, sink)
end


"""
    apply_choice(::YesSinkNoResults, x, sink)

Internal function to apply a choice for yes sink and no results scenarios.
"""
function apply_choice(::YesSinkNoResults, x, sink)
    try
        return x |> jsontable |> sink
    catch
        return x |> x -> sink([x])
    end
end


"""
    apply_choice(::YesSinkNoResults, x, sink)

Internal function to apply a choice for no sink and no results scenarios.
"""
function apply_choice(::YesSinkNoResults, x, sink::Nothing)
    return apply_choice(NoSinkNoResults(), x, sink)
end


"""
    apply_choice(::NoSinkYesTickers, x, sink)

Internal function to apply a choice for no sink and yes tickers scenarios.
"""
function apply_choice(::NoSinkYesTickers, x, sink)
    return x.tickers
end


"""
    apply_choice(::YesSinkYesTickers, x, sink)

Internal function to apply a choice for yes sink and yes tickers scenarios.
"""
function apply_choice(::YesSinkYesTickers, x, sink)
    return x.tickers |> jsontable |> sink
end


"""
    apply_choice(::YesSinkYesTickers, x, sink::Nothing)

Internal function to apply a choice for no sink and yes tickers scenarios.
"""
function apply_choice(::YesSinkYesTickers, x, sink::Nothing)
    return apply_choice(NoSinkYesTickers(), x, sink)
end


"""
    apply_choice(::NoSinkYesTicker, x, sink)

Internal function to apply a choice for no sink and yes tickers scenarios.
"""
function apply_choice(::NoSinkYesTicker, x, sink)
    return x.ticker
end


"""
    apply_choice(::YesSinkYesLast, x, sink)

Internal function to apply a choice for yes sink and yes last scenarios.
"""
function apply_choice(::YesSinkYesLast, x, sink)
    return x.last |> x -> sink([x])
end


"""
    apply_choice(::NoSinkYesLast, x, sink)

Internal function to apply a choice for no sink and yes last scenarios.
"""
function apply_choice(::NoSinkYesLast, x, sink)
    return x.last
end


"""
    apply_choice(::YesSinkYesLast, x, sink::Nothing)

Internal function to apply a choice for no sink and yes last scenarios.
"""
function apply_choice(::YesSinkYesLast, x, sink::Nothing)
    return apply_choice(NoSinkYesLast(), x, sink)
end


"""
    apply_choice(::YesSinkYesTicker, x, sink)

Internal function to apply a choice for yes sink and yes ticker scenarios.
"""
function apply_choice(::YesSinkYesTicker, x, sink)
    try
        return x.ticker |> jsontable |> sink
    catch
        return x.ticker |> x -> sink([x])
    end
end


"""
    apply_choice(::YesSinkYesTicker, x, sink::Nothing)

Internal function to apply a choice for yes sink and yes ticker scenarios.
"""
function apply_choice(::YesSinkYesTicker, x, sink::Nothing)
    return x.ticker
end


"""
    apply_choice(::NoSinkYesData, x, sink)

Internal function to apply a choice for no sink and yes data scenarios.
"""
function apply_choice(::NoSinkYesData, x, sink)
    return x.data
end


"""
    apply_choice(::YesSinkYesData, x, sink)

Internal function to apply a choice for yes sink and yes data scenarios.
"""
function apply_choice(::YesSinkYesData, x, sink)
    try
        return x.data |> jsontable |> sink
    catch
        return x.data |> x -> sink([x])
    end
end


"""
    apply_choice(::YesSinkYesData, x, sink::Nothing)

Internal function to apply a choice for no sink and yes data scenarios.
"""
function apply_choice(::YesSinkYesData, x, sink::Nothing)
    return apply_choice(NoSinkYesData(), x, sink)
end


"""
    apply_choice(::YesSinkYesTicks, x, sink)

Internal function to apply a choice for yes sink and yes ticks scenarios.
"""
function apply_choice(::YesSinkYesTicks, x, sink)
    return x.ticks |> jsontable |> sink
end


"""
    apply_choice(::NoSinkYesTicks, x, sink)

Internal function to apply a choice for no sink and yes ticks scenarios.
"""
function apply_choice(::NoSinkYesTicks, x, sink)
    return x.ticks
end


"""
    apply_choice(::YesSinkYesTicks, x, sink::Nothing)

Internal function to apply a choice for no sink and yes ticks scenarios.
"""
function apply_choice(::YesSinkYesTicks, x, sink::Nothing)
    return apply_choice(NoSinkYesTicks(), x, sink)
end
