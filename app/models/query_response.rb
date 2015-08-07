class QueryResponse
  attr_reader :body

  def initialize(query)
    encoded_query = ERB::Util.url_encode(query)
    @body = Curl.get("https://api.mercadolibre.com/sites/MLA/search?q=#{encoded_query}").body
  end
end
