"""
    AbstractPolyOptions

Abstract base type for all generic options.
"""
abstract type AbstractPolyOptions end


"""
    PolyOpts <: AbstractPolyOptions

# api_key: String representing the API key from a registered polygon.io account.
# table: Boolean value specifying where the results should be tabularized or not.
"""
struct PolyOpts <: AbstractPolyOptions
    api_key::String
    table::Bool
end

