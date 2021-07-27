# Stocks API

The following endpoints are covered by the Stocks API via these functions:

* `stocks_trades`                    => Trades
* `stocks_quotes_nbbo`               => Quotes (NBBO)
* `stocks_last_trade_symbol`         => Last Trade for a Symbol v2
* `stocks_last_quote_symbol`         => Last Quote for a Symbol v2
* `stocks_daily_open_close`          => Daily Open/Close
* `stocks_grouped_daily_bars`        => Grouped Daily Bars
* `stocks_previous_close`            => Previous Close
* `stocks_aggregates_bars`           => Aggregates (Bars)
* `stocks_snapshot_all_tickers`      => Snapshot All Tickers
* `stocks_snapshot_ticker`           => Snapshot Ticker
* `stocks_snapshot_gainers_losers`   => Snapshot Gainers/Losers

Detailed information on each function can be extracted in Julia. For example;

```julia
using PolygonIO
julia>?tickers
```
