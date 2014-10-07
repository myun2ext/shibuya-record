require 'shibuya_record/query_generators/where'

module ShibuyaRecord
  module QueryGenerators
    class Delete
      attr_reader :query, :values

      def initialize(params)
        @params
      end

      def generate
        @query, @values = Delete.generate(@params)
      end

      def self.generate(params)
        query = "DELETE FROM "
        values = []

        table_name = params[:table_name] || params[:table]
        query += table_name.to_s

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
