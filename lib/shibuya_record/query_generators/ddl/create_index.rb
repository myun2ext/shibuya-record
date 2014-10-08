module ShibuyaRecord
  module QueryGenerators
    module Ddl
      class CreateIndex
        attr_reader :query

        def initialize(params)
          @params
        end

        def generate
          @query = CreateIndex.generate(@params)
        end

        def self.generate(params)
          query = "CREATE "
          query += "UNIQUE " if params[:unique] && params[:unique] != false && params[:unique] != nil
          table_name = params[:table_name] || params[:table]
          columns = params[:columns].join(", ")
          query += "INDEX #{index_name(params)} ON #{table_name} (#{columns})"
        end

        def self.unique(params)
          generate(params.merge({ unique: true }))
        end

        def self.index_name(params)
          table_name = params[:table_name] || params[:table]
          "index_#{table_name}_on_" + params[:columns].join("_and_")
        end
      end
    end
  end
end
