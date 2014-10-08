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

            case action
            when "ADD", "CHANGE"
              type = params[:column_type] || params[:type]
              definition = "#{column} #{type}"
            when "DROP"
              definition = "#{column}"
            when "RENAME"
              from_column = params[:from_column] || params[:from_column_name]
              to_column = params[:to_column] || params[:to_column_name]
              definition = "#{from_column} TO #{to_column}"
            end
          end

          query = "ALTER TABLE #{table} #{action} #{target} #{definition}"
        end

        def self.add_column(table_name, params)
          generate(params.merge({ table_name: table_name, action: "ADD", target: "COLUMN" }))
        end

        def self.drop_column(table_name, params)
          generate(params.merge({ table_name: table_name, action: "DROP", target: "COLUMN" }))
        end
        def self.remove_column(table_name, params); drop_column(table_name, params); end

        def self.change_column(table_name, params)
          generate(params.merge({ table_name: table_name, action: "CHANGE", target: "COLUMN" }))
        end

        def self.rename_column(table_name, params)
          generate(params.merge({ table_name: table_name, action: "RENAME", target: "COLUMN" }))
        end
      end
    end
  end
end
