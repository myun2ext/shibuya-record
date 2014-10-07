require 'shibuya_record/query_generators/where'

module ShibuyaRecord
  module QueryGenerators
    class Select
      attr_reader :query, :values

      def initialize(params)
        @params
      end

      def generate
        @query, @values = Select.generate(@params)
      end

      def self.generate(params)
        query = "SELECT "
        values = []

        columns = params[:columns] || ["*"]
        table_name = params[:table_name] || params[:table]
        query += columns.join(", ")
        query += " FROM " + table_name.to_s

        if params[:where]
          where = Where.new(params[:where])
          where.generate
          query += where.query
          values += where.values
        end

        [query, values]
      end
    end
  end
end
