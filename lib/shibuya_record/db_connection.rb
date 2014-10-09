module ShibuyaRecord
  module DbConnection
    attr_reader :connection

    def initialize(driver, params)
      @connection = driver.new(params)
    end
    alias db_connection connection
  end
end
