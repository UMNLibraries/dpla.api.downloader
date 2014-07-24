module DplaDownloader
  Url = Struct.new(:api_key, :page_size, :query, :next_page) do
    def build
      "http://api.dp.la/v2/items?api_key=#{api_key}&page_size=#{page_size}#{query}#{page}"
    end

    def page
      (next_page) ?  "&page=#{next_page}" : nil
    end
  end
end