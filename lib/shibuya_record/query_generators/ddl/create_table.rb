module ShibuyaRecord
  module QueryGenerators
    module Ddl
      class CreateTable
        attr_reader :query

        def initialize(params)
          @params
        end

        def generate
          @query = CreateTable.generate(@params)
        end

        def self.generate(params)
          query = "CREATE TABLE "

          table_name = params[:table_name] || params[:table]
          query += table_name.to_s + " ("
          query += params[:columns].map { |column|
            name = column[:name]
            type = type_map(column[:type])
            length = column[:length]

            s = "#{name} #{type}"
            s += "(#{length})" if length
            s += " " + column[:options] if column[:options]
            s
          }.join(", ") + ")"
        end

        def self.type_map(type)
          case type
          when :string
            "VARCHAR"
          else
            type.upcase
          end
        end
      end
    end
  end
end
