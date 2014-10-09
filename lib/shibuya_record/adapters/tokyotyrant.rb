require 'tokyotyrant'

module ShibuyaRecord
  module Adapters
    class Tokyotyrant
      attr_reader :connection

      def initialize(params)
        @connection = create_connection(params)
      end

      def self.create_connection(params)
        TokyoTyrant::RDB::new(params)
      end

      def read(key)
        connection.get key; end

      def write(key, value)
        connection.set key, value; end

      def query(query_string, *params)
        connection.exec(query_string, params)
      end
    end
  end
end
