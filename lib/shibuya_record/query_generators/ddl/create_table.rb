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
            s += " " + option_string(column)
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

        private
        def self.option_string(options)
          #options.map do |option|
          s = ""
          s += "AUTO_INCREMENT " if options[:auto_increment]
          s += "NOT NULL " if options[:not_null]
          s += "DEFAULT #{options[:default]} " if options[:default]
          s
        end
      end
    end
  end
end
