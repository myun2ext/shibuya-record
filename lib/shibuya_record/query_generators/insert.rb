module ShibuyaRecord
  module QueryGenerators
    class Insert
      attr_reader :query, :values

      def initialize(params)
        @params
      end

      def generate
        @query, @values = Insert.generate(@params)
      end

      def self.generate(params)
        query = "INSERT INTO "
        values = []

        table_name = params[:table_name] || params[:table]
        query += table_name.to_s + " ("

        columns = params[:values].keys
        query += columns.join(", ") + ") VALUES ("
        query += ("?, " * (columns.length - 1)) + "?)"
        values += params[:values].values

        [query, values]
      end
    end
  end
end
