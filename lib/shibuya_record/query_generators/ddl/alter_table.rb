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
          table =  params[:table_name] || params[:table]
          action = params[:action].to_s.upcase
          target = params[:target].to_s.upcase
          definition = params[:definition]

          if target == "COLUMN"
            column = params[:column] || params[:column_name]
            type = params[:column_type] || params[:type]
            definition = "#{column} #{type}"
          end

          query = "ALTER TABLE #{table} #{action} #{target} #{definition}"
        end

        def self.add_column(params)
          generate(params.merge({action: "ADD", target: "COLUMN"}))
        end

        def self.remove_column(params)
          generate(params.merge({action: "REMOVE", target: "COLUMN"}))
        end

        def self.change_column(params)
          generate(params.merge({action: "CHANGE", target: "COLUMN"}))
        end
      end
    end
  end
end
