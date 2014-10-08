module ShibuyaRecord
  module QueryGenerators
    module Ddl
      class Drop
        attr_reader :query

        def initialize(params)
          @params
        end

        def generate
          @query = Drop.generate(@params)
        end

        def self.generate(params)
          type = params[:type].to_s.upcase
          target = params[:target].to_s.upcase
          query = "DROP #{type} #{name}"
        end

        def self.drop_table(name)
          generate(type: :table, target: name); end
        def self.drop_index(name)
          generate(type: :index, target: name); end
      end
    end
  end
end
