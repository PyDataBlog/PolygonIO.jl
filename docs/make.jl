using PolygonIO
using Documenter

DocMeta.setdocmeta!(PolygonIO, :DocTestSetup, :(using PolygonIO); recursive=true)

makedocs(;
    modules=[PolygonIO],
    authors="PyDataBlog <bbrenyah@gmail.com> and contributors",
    repo="https://github.com/PyDataBlog/PolygonIO.jl/blob/{commit}{path}#{line}",
    sitename="PolygonIO.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://PyDataBlog.github.io/PolygonIO.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Reference" => "reference.md",
        "Stocks" => "stocks.md",
        "Crypto" => "crypto.md",
        "Forex" => "forex.md",
        "Streaming" => "streaming.md"
    ],
)

deploydocs(;
    repo="github.com/PyDataBlog/PolygonIO.jl",
)
