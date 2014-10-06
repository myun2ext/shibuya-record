module ShibuyaRecord
  module Validation
    def validate(column, options)
      @column = column
      @options = options
    end
  end
end
