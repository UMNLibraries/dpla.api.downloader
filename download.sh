#!/usr/bin/env ruby

require './init.rb'

downloader = DplaDownloader::Download.new(APP_CONFIG['dpla_api_key'], 500)
downloader.run_queries