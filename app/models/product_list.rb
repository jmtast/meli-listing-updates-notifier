require 'item'

class ProductList
  attr_reader :products, :results

  def initialize(response)
    @products = ActiveSupport::HashWithIndifferentAccess.new(JSON.parse(response.body))
    @results  = @products[:results]
  end

  def self.test_results
    @test_results = self.new(ApplicationHelper.query).results.map do |result|
      params = { meli_id: result[:id] }
      # Available keys in each result:
      # "id", "site_id", "title", "subtitle", "seller", "price", "currency_id", "available_quantity",
      # "sold_quantity", "buying_mode", "listing_type_id", "stop_time", "condition", "permalink", "thumbnail",
      # "accepts_mercadopago", "installments", "address", "shipping", "seller_address", "seller_contact",
      # "location", "attributes", "original_price", "category_id", "official_store_id"
      params.merge!(result.slice(:title, :price, :stop_time, :permalink, :thumbnail))
      Item.new(params)
    end
  end
end
