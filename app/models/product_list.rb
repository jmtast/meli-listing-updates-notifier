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
      params.merge!(result.slice(:title, :price, :stop_time, :permalink))
      Item.new(params)
    end
  end
end
