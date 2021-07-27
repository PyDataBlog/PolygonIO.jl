# Stocks API

The following endpoints are covered by the Stocks API via these functions:

* `stock_trades`                    => Trades
* `stock_quotes_nbbo`               => Quotes (NBBO)
* `stock_last_trade_symbol`         => Last Trade for a Symbol v2
* `stock_last_quote_symbol`         => Last Quote for a Symbol v2
* `stock_daily_open_close`          => Daily Open/Close
* `stock_grouped_daily_bars`        => Grouped Daily Bars
* `stock_previous_close`            => Previous Close
* `stock_aggregates_bars`           => Aggregates (Bars)
* `stock_snapshot_all_tickers`      => Snapshot All Tickers
* `stock_snapshot_ticker`           => Snapshot Ticker
* `stock_snapshot_gainers_losers`   => Snapshot Gainers/Losers

Detailed information on each function can be extracted in Julia. For example;

```julia
using PolygonIO
julia>?tickers
```
