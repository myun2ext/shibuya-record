module ShibuyaRecord
  module Validations
    class Presence
      def self.valid?(value)
        if value == nil || value == [] || value == {}
          false
        else
          true
        end
      end
    end
  end
end
