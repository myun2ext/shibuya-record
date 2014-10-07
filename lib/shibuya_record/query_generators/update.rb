require 'shibuya_record/query_generators/where'

module ShibuyaRecord
  module QueryGenerators
    class Update
      attr_reader :query, :values

      def initialize(params)
        @params
      end

      def generate
        @query, @values = Update.generate(@params)
      end

      def self.generate(params)
        query = "UPDATE "
        values = []

        table_name = params[:table_name] || params[:table]
        query += table_name.to_s + " SET "

        query += params[:set].map { |key,value|
          values << value
          "#{key} = ?"
        }.join(", ")

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
