module Repositories
  module Products
    class Memory
      def initialize
        @products = {}
        @next_id = 1
      end

      def clear
        initialize
      end

      def all
        @products.values
      end

      def save(product)
        product.id = @next_id
        @products[@next_id] = product
        @next_id += 1
        product
      end

      def all_products_for(store_id: store_id)
        @products.values.select do |product|
          product.store_id == store_id
        end
      end

      def find_by_id(id)
        @products[id]
      end
    end
  end
end
