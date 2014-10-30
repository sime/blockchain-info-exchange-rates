require 'minitest/autorun'
require 'rr'
require 'money/bank/blockchain_info_exchange_rates'
require 'monetize'
require 'timecop'
require 'pry'
require 'fakeweb'

FakeWeb.allow_net_connect = false
