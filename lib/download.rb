module DplaDownloader
  class Download

    def initialize(url)
      @url = url
      @url.next_page = 1
    end

    def run_queries
      APP_CONFIG['queries'].each do |query|
        @url.query = query
        run_query(@url.build)
      end
    end

    def run_query(url)
      puts "Donloading: #{url}"
      results = search(url)
      results['docs'].each do |result|
        persist(result)
      end
      @url.next_page = results['next_page']
      run_query(@url.build) if @url.next_page
    end

    def search(url)
      response = HTTParty.get(url)
      r = JSON.parse(response.body)
      {'docs' => r['docs'], 'next_page' => next_page(r['start'], r['limit'], r['count']) }
    end

    def next_page(start, limit, count)
      (start + limit >= count) ? false : (start + limit) / limit + 1
    end

    def persist(data)
        File.open("data/#{data['id']}.json", 'w') {|file| file.write(data.to_json)}
    end
  end
end