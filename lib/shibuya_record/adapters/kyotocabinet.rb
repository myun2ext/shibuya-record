require 'kyotocabinet'

module ShibuyaRecord
  module Adapters
    class Kyotocabinet
      attr_reader :connection

      def self.model
        :kvs; end

      def initialize(params)
        @connection = create_connection(params)
      end

      def self.create_connection(params)
        KyotoCabinet::DB::new(params)
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
