module ShibuyaRecord
  module QueryGenerators
    class Where
      attr_reader :query, :values

      def initialize(conditions)
        @conditions = conditions
      end

      def generate
        @query, @values = Where.generate(@conditions)
      end

      def self.generate(conditions)
        query, values = Where.conditions(conditions)
        [" WHERE "+ query, values]
      end

      def self.conditions(conditions)
        values = []
        condition_list = conditions.map do |key, value|
          values << value
          "#{key} = ?"
        end
        query = condition_list.join(" AND ")
        [query, values]
      end
    end
  end
end
