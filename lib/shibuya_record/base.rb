require 'shibuya_record/attributes'
require 'shibuya_record/table_name'
require 'shibuya_record/query'
require 'shibuya_record/db_connection'

module ShibuyaRecord
  class Base
    extend ShibuyaRecord::Attributes
    extend ShibuyaRecord::TableName
    include ShibuyaRecord::Query
    include ShibuyaRecord::DbConnection

    def initialize(*params)
      params = params.first
      if params
        self.class.record_attributes.each do |attribute|
          value = params[attribute.to_s] || params[attribute]
          self.send(attribute.to_s + "=", value)
        end
      end
    end

    def table_name
      ShibuyaRecord::Base.table_name
    end
  end
end
