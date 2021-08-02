# Reference API

The following endpoints are covered by the Reference API via these functions:

* `tickers`                         => Tickers
* `ticker_types`                    => Ticker Types
* `ticker_details`                  => Ticker Details
* `ticker_details_vX`               => Ticker Details vX
* `ticker_news`                     => Ticker News
* `markets`                         => Markets
* `locales`                         => Locales
* `stock_splits`                    => Stock Splits
* `stock_dividends`                 => Stock Dividends
* `stock_financials`                => Stock Financials
* `market_holidays`                 => Market Holidays
* `market_status`                   => Market Status
* `stock_exchanges`                 => Stock Exchanges
* `condition_mappings`              => Condition Mappings
* `crypto_exchanges`                => Crypto Exchanges

Detailed information on each function can be extracted in Julia. For example;

```julia
using PolygonIO
julia>?tickers
```
