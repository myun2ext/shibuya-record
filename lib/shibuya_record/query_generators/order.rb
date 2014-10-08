module ShibuyaRecord
  module QueryGenerators
    class Order
      def self.order(*column)
        "ORDER BY #{order_columns(column)}"
      end

      def self.order_columns(column)
        if column.is_a? Array
          column.map { |column|
          }.join(", ")
        else
          column
        end
      end
    end
  end
end
