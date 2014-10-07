require 'shibuya_record/query_generators/where'

module ShibuyaRecord
  module QueryGenerators
    class Join
      attr_reader :query, :values

      def initialize(params)
        @params
      end

      def generate
        @query, @values = Join.generate(@params)
      end

      def self.generate(params)
        join_type = normalize_join_type(params[:type])
        query = "#{join_type} JOIN "
        values = []

        table_name = params[:table_name] || params[:table]
        query += table_name.to_s + " ON "

        on_query, on_values = Where.conditions(params[:on])
        query += on_query
        values += on_values

        [query, values]
      end

      private
      def self.normalize_join_type(type)
        type
      end
    end
  end
end
