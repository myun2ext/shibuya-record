require 'shibuya_record/query_generators/select'
require 'shibuya_record/query_generators/insert'
require 'shibuya_record/query_generators/update'
require 'shibuya_record/query_generators/delete'

module ShibuyaRecord
  module Query
    def select(params)
      query(:select, params); end

    def update(params)
      query(:update, params); end

    def delete(params)
      query(:delete, params); end

    def insert(params)
      query(:insert, params); end

    private
    def query(type, params)
      params = params.dup
      params[:table_name] = table_name
      query, values = generator(type).new(params)
      db_connection.query(query, value)
    end

    def generator(type)
      QueryGenerators.const_get(type.to_s.capitalize)
    end
  end
end
