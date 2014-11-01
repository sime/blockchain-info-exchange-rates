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

      def get_rate(from_currency, to_currency, opts = {})
        expire_rates
        super
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

