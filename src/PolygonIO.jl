module PolygonIO

# Gloabl Imports
using JSON3
using JSONTables
using HTTP


######### Import modules & utils ################
include("utils.jl")
include("crypto_api.jl")
include("custom_structs.jl")
include("forex_api.jl")
include("reference_api.jl")
include("stock_api.jl")
include("streaming_socket.jl")



######### Global export of user API  ################
export PolyOpts, tickers, ticker_types, ticker_details, ticker_details_vX,
       ticker_news, markets, locales, stock_splits, stock_dividends,
       stock_financials, market_holidays, market_status, stock_exchanges,
       condition_mappings, crypto_exchanges,

       trades, quotes_nbbo, last_trade_symbol, last_quote_symbol, daily_open_close,
       grouped_daily_bars, previous_close, aggregates_bars, snapshot_all_tickers,
       snapshot_ticker, snapshot_gainers_losers


end
