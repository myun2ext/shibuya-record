module ShibuyaRecord
  class DbConnection
    attr_reader :connection

    def initialize(driver, params)
      @connection = driver.new(params)
    end
  end
end
