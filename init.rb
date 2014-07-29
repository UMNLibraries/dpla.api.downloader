# Use the class methods to get down to business quickly
require 'httparty'
require 'json'

ENVIRONMENT = (ENV['DHUB_INDEXER_ENV']) ? ENV['DHUB_INDEXER_ENV'] : 'development'
APP_CONFIG = YAML.load_file("config.yml")[ENVIRONMENT]

require './lib/download.rb'