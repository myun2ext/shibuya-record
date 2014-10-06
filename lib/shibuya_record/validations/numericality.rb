module ShibuyaRecord
  module Validations
    class Numericality
      def self.valid?(value, options)
        return true if value.is_a? Numeric

        if value.is_a? String
          return true if value ~= /\A\d+\z/
        end

        false
      end
    end
  end
end
