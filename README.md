# Money Blockchain.info Exchange Rates

Blockchain.info Ruby Money exchange bank.

This is a direct rip/port of [Money Open Exchange Rates](https://github.com/spk/money-open-exchange-rates). This library experimental and not used in production.

## Installation
Gemfile:
~~~ yaml
gem 'blockchain-info-exchange-rates', require: 'money/bank/blockchain_info_exchange_rates'
~~~

## Usage
~~~ ruby
bie = Money::Bank::BlockchainInfoExchangeRates.new
bie.cache = 'path/to/file/cache'

# If the cache is empty:
# Fetch new rates from Blockchain.info and cache
bie.save_rates

# Import rates from cache to Money Object
bie.update_rates

# Rates expire every 15 minutes
bie.ttl_in_seconds = 900

# Default Bank
config.default_bank = bie
~~~

## License
The MIT License
