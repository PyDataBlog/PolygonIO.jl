# Crypto API

The following endpoints are covered by the Crypto API via these functions:

* `last_trade_crypto_pair`                    => Last Trade for a Crypto Pair
* `crypto_daily_open_close`                   => Daily Open/Close
* `historic_crypto_trades`                    => Historic Crypto Trades
* `crypto_grouped_daily_bars`                 => Grouped Daily (Bars)
* `crypto_previous_close`                     => Previous Close
* `crypto_aggregates_bars`                    => Aggregates (Bars)
* `crypto_snapshot_all_tickers`               => Snapshot All Tickers
* `crypto_snapshot_ticker`                    => Snapshot Ticker
* `crypto_snapshot_ticker_full_book`          => Snapshot Ticker Full Book (L2)
* `crypto_snapshot_gainers_losers`            => Snapshot Gainers/Losers

Detailed information on each function can be extracted in Julia. For example;

```julia
julia>?last_trade_crypto_pair
```
