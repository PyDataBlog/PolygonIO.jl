```@meta
CurrentModule = PolygonIO
```

# PolygonIO

Documentation for [PolygonIO](https://github.com/PyDataBlog/PolygonIO.jl).

`PolygonIO.jl` is a client accessing the WebSocket and RESTful APIs of [Polygon.io](https://polygon.io/) in native [Julia](https://julialang.org/).

## Installation

To install `PolygonIO` either do

```julia
using Pkg
Pkg.add("PolygonIO")
```

or switch to `Pkg` mode with `]` and issue

```julia
pkg> add PolygonIO
```

## Usage

```julia
using PolygonIO
opts = PolyOpts(API_KEY, Table.jl Supported Tabular Interface As Sink or nothing)
data = API_FUNC(opts, [args...]; [kwargs...])
```

### Example

```julia
using PolygonIO
using DataFrames

opts = PolyOpts(API_KEY, DataFrame)
ticker_search_info = tickers(opts, "bitcoin")
```

```julia
julia> ticker_search_info = tickers(opts, "bitcoin")
10×10 DataFrame
 Row │ ticker       name                               market  locale  active  currency_symbol  currency_name         base_curre ⋯
     │ String       String                             String  String  Bool    String           String                String     ⋯
─────┼────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
   1 │ X:BSVUSD     Bitcoin SV - United States Dollar  crypto  global    true  USD              United States Dollar  BSV        ⋯
   2 │ X:BTCJPY     Bitcoin - Japanese Yen             crypto  global    true  JPY              Japanese Yen          BTC
   3 │ X:BCHGBP     Bitcoin Cash - Great Britian Pou…  crypto  global    true  GBP              Great Britian Pound   BCH
   4 │ X:BTCGBP     Bitcoin Cash - Great Britain Pou…  crypto  global    true  GBP              Great Britain Pound   BTC
   5 │ X:BCHCZK     Bitcoin Cash - Czech Koruna        crypto  global    true  CZK              Czech Koruna          BCH        ⋯
   6 │ X:ETHBTC     Ethereum - Bitcoin                 crypto  global    true  BTC              Bitcoin               ETH
   7 │ X:BTCEUR     Bitcoin - Euro                     crypto  global    true  EUR              Euro                  BTC
   8 │ X:BCHABCUSD  Bitcoin Cash ABC - United States…  crypto  global    true  USD              United States Dollar  BCHABC
   9 │ X:ATMUSD     Bitcoin ATM - United States Doll…  crypto  global    true  USD              United States Dollar  ATM        ⋯
  10 │ X:BCHUSD     Bitcoin Cash - United States Dol…  crypto  global    true  USD              United States Dollar  BCH
                                                                                                                 3 columns omitted
```

## Features

- [X] Full coverage of Stock API
- [X] Full coverage of Forex API
- [X] Full coverage of Crypto API
- [X] Full coverage of Reference Data API
- [ ] Full coverage of WebSocket API

```@index
```

```@autodocs
Modules = [PolygonIO]
```
