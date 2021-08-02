"""
    AbstractPolyOptions

Abstract base type for all generic options.
"""
abstract type AbstractPolyOptions end

"""
    AbstractPolyChoice

Abstract base type for dispatching extracted JSONs.
"""
abstract type AbstractPolyChoice end


"""
    PolyOpts <: AbstractPolyOptions

User options for the PolygonIO.

# Options
 * api_key: String representing the API key from a registered polygon.io account.
 * table: Whether to covnert extracted results as a table or not. Compatible Table.jl or nothing for raw JSONs.


# Examples
```julia-repl
julia> using PolygonIO, DataFrames
julia> opts = PolyOpts(API_KEY, DataFrame)  # if user wants tabularised output
julia> opts = PolyOpts(API_KEY, nothing)    # if user wants raw JSON output
```
"""
struct PolyOpts{T1<:AbstractString, T2<:Any} <: AbstractPolyOptions
    api_key::T1
    sink::T2
end

########## No Sink Structs  ##################
"""
Internal function to dispatch on no sink no results scenarios.
"""
struct NoSinkNoResults <: AbstractPolyChoice end


"""
Internal function to dispatch on no sink yes results scenarios.
"""
struct NoSinkYesResults <: AbstractPolyChoice end


"""
Internal function to dispatch on no sink yes tickers scenarios.
"""
struct NoSinkYesTickers <: AbstractPolyChoice end


"""
Internal function to dispatch on no sink yes ticker scenarios.
"""
struct NoSinkYesTicker <: AbstractPolyChoice end


"""
Internal function to dispatch on no sink yes last scenarios.
"""
struct NoSinkYesLast <: AbstractPolyChoice end


"""
Internal function to dispatch on no sink yes data scenarios.
"""
struct NoSinkYesData <: AbstractPolyChoice end


"""
Internal function to dispatch on no sink yes ticks scenarios.
"""
struct NoSinkYesTicks <: AbstractPolyChoice end


########### Yes Sink Structs ##################
"""
Internal function to dispatch on yes sink no last scenarios.
"""
struct YesSinkYesLast <: AbstractPolyChoice end


"""
Internal function to dispatch on yes sink yes tickers scenarios.
"""
struct YesSinkYesTickers <: AbstractPolyChoice end


"""
Internal function to dispatch on yes sink yes ticker scenarios.
"""
struct YesSinkYesTicker <: AbstractPolyChoice end


"""
Internal function to dispatch on yes sink no results scenarios.
"""
struct YesSinkNoResults <: AbstractPolyChoice end


"""
Internal function to dispatch on yes sink yes results scenarios.
"""
struct YesSinkYesResults <: AbstractPolyChoice end


"""
Internal function to dispatch on yes sink yes data scenarios.
"""
struct YesSinkYesData <: AbstractPolyChoice end


"""
Internal function to dispatch on yes sink yes ticks scenarios.
"""
struct YesSinkYesTicks <: AbstractPolyChoice end
