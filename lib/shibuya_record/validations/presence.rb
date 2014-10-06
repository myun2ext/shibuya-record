module ShibuyaRecord
  module Validations
    class Presence
      def valid?(value)
        if value == nil || value == [] || value == {} || value == ""
          false
        else
          true
        end
      end
    end
  end
end
