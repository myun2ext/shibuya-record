module ShibuyaRecord
  module QueryGenerators
    module Ddl
      class AlterTable
        attr_reader :query

        def initialize(params)
          @params
        end

        def generate
          @query = AlterTable.generate(@params)
        end

        def self.generate(params)
          table = params[:table_name] || params[:table]
          action = params[:action].upcase
          target = params[:target].upcase
          definition = params[:definition]
          query = "ALTER TABLE #{table} #{action} #{target} #{definition}"
        end

        def self.add_column(params)
          generate(params.merge({action: "ADD", target: "COLUMN"}))
        end
      end
    end
  end
end
