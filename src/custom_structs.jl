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

# api_key: String representing the API key from a registered polygon.io account.
# table: Boolean value specifying where the results should be tabularized or not.
"""
struct PolyOpts <: AbstractPolyOptions
    api_key::String
    sink::Any
end

# No Sink Structs
struct NoSinkNoResults <: AbstractPolyChoice end
struct NoSinkYesResults <: AbstractPolyChoice end
struct NoSinkYesTickers <: AbstractPolyChoice end
struct NoSinkYesTicker <: AbstractPolyChoice end
struct NoSinkYesLast <: AbstractPolyChoice end
struct NoSinkYesData <: AbstractPolyChoice end
struct NoSinkYesTicks <: AbstractPolyChoice end


# Yes Sink Structs
struct YesSinkYesLast <: AbstractPolyChoice end
struct YesSinkYesTickers <: AbstractPolyChoice end
struct YesSinkYesTicker <: AbstractPolyChoice end
struct YesSinkNoResults <: AbstractPolyChoice end
struct YesSinkYesResults <: AbstractPolyChoice end
struct YesSinkYesData <: AbstractPolyChoice end
struct YesSinkYesTicks <: AbstractPolyChoice end
