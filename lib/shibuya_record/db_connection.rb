module ShibuyaRecord
  class DbConnection
    attr_reader :connection

    def initialize(connection)
      @connection = connection
    end
  end
end
