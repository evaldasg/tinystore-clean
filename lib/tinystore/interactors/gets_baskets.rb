class GetsBaskets
  def initialize(store_id: nil, customer_id: nil)
    @store_id = store_id
    @customer_id = customer_id
    @repo = Repository.for(:basket)
  end

  def basket
    return [] unless store_id
    products_ids = repo.all_products_for(customer_id: customer_id)
    filter_by_store(products_ids)
  end

  private
  attr_reader :repo, :store_id, :customer_id

  def filter_by_store(ids)
    ids.map do |product_id|
      GetsProducts.new(store_id: store_id).find_by_id(product_id).fetch(:id)
    end.compact
  end
end
