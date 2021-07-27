# Forex API

The following endpoints are covered by the Forex API via these functions:

* `historic_forex_ticks`                => Historic Forex Ticks
* `real_time_currency_conversion`       => Real-time Currency Conversion
* `last_quote_currency_pair`            => Last Quote for a Currency Pair
* `forex_grouped_daily_bars`            => Aggregates (Bars)
* `forex_previous_close`                => Grouped Daily (Bars)
* `forex_aggregates_bars`               => Previous Close
* `forex_snapshot_ticker`               => Snapshot - All Tickers
* `forex_snapshot_all_tickers`          => Snapshot - Gainers/Losers
* `forex_snapshot_gainers_losers`       => Snapshot - Ticker

Detailed information on each function can be extracted in Julia. For example;

```julia
julia>?historic_forex_ticks
```