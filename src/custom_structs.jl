# Publisher struct
@Base.kwdef mutable struct Publisher
    name::String = ""
    homepage_url::String = ""
    logo_url::String = ""
    favicon_url::String = ""
end


# NewsRecord struct
@Base.kwdef mutable struct NewsRecord
    id::String = ""
    publisher::Publisher = Publisher()
    title::String = ""
    author::String = ""
    published_utc::String = ""
    article_url::String = ""
    tickers::Vector{String} = String[]
    amp_url::String = ""
    image_url::String = ""
    description::String = ""
    keywords::Vector{String} = String[]
end


# News struct
@Base.kwdef mutable struct News
    results::Vector{NewsRecord} = NewsRecord[]
    status::String = ""
    request_id::String = ""
    count::Int = 0
end


# Make all custom struct types mutable
StructTypes.StructType(::Type{NewsRecord}) = StructTypes.Mutable()
StructTypes.StructType(::Type{News}) = StructTypes.Mutable()
StructTypes.StructType(::Type{Publisher}) = StructTypes.Mutable()

