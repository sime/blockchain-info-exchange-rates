require 'open-uri'
require 'money'
require 'json'

class Money
  module Bank
    class InvalidCache < StandardError ; end
    class BlockchainInfoExchangeRates < Money::Bank::VariableExchange

      TICKER_URL = 'https://blockchain.info/ticker'

      attr_accessor :cache

      attr_reader :bi_rates, :ttl_in_seconds, :rates_expiration

      def ttl_in_seconds=(value)
        @ttl_in_seconds = value
        refresh_rates_expiration if ttl_in_seconds
      end

      def update_rates
        exchange_rates.each do |currency, rate|
        next unless Money::Currency.find(currency)
          set_rate('BTC', currency, rate)
          set_rate(currency, 'BTC', 1.0/rate)
        end
      end

      def save_rates
        raise InvalidCache unless cache
        text = read_from_url
        if has_valid_rates?(text)
          store_in_cache(text)
        end
      rescue Errno::ENOENT
        raise InvalidCache
      end

      def expire_rates
        if ttl_in_seconds && rates_expiration <= Time.now
          update_rates
          refresh_rates_expiration
        end
      end

      protected
      # Store the provided text data by calling the proc method provided
      # for the cache, or write to the cache file.
      def store_in_cache(text)
        if cache.is_a?(Proc)
          cache.call(text)
        elsif cache.is_a?(String)
          open(cache, 'w') do |f|
            f.write(text)
          end
        end
      end

      def has_valid_rates?(text)
        parsed = JSON.parse(text)
        parsed && parsed.has_key?('USD')
      rescue JSON::ParserError
        false
      end

      def read_from_cache
        if cache.is_a?(Proc)
          cache.call(nil)
        elsif cache.is_a?(String) && File.exist?(cache)
          open(cache).read
        end
      end

      def read_from_url
        data = open(TICKER_URL).read
        format_rates(data)
      end

      def format_rates(data)
        data = JSON.parse data
        output = {}
        data.each do |currency, value|
          output[currency] = value["last"]
        end
        JSON.generate output
      end

      def exchange_rates
        @doc = JSON.parse(read_from_cache || read_from_url)
        @bi_rates = @doc
        @doc
      end

      def refresh_rates_expiration
        @rates_expiration = Time.now + ttl_in_seconds
      end
    end
  end
end
if false
  bie = Money::Bank::BlockchainInfoExchangeRates.new
  bie.cache = '/tmp/bogus.cache.json'
  bie.update_rates

  #money = Money.new(0, "USD")

  btc = {
    :priority => 1,
    :iso_code => "BTC",
    :name => "Bitcoin",
    :symbol => "BTC",
    :subunit => "Cent",
    :subunit_to_unit => 1000,
    :separator => ".",
    :delimiter => ","
  }
  Money::Currency.register(btc)
  rate = 13.7603
  bie.add_rate("USD", "BTC", 1 / 13.7603)
  bie.add_rate("BTC", "USD", rate)
  bie.exchange_with(100.to_money("BTC"), 'USD').cents.must_equal 137603
end
