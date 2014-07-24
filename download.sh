#!/usr/bin/env ruby

require './init.rb'


url = DplaDownloader::Url.new(APP_CONFIG['dpla_api_key'], 500)
downloader = DplaDownloader::Download.new(url)
downloader.run_queries