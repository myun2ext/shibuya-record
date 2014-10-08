module ShibuyaRecord
  module QueryGenerators
    class Limit
      def self.limit(value, offset: nil)
        if offset
          "LIMIT ?, ?", [offset, value]
        else
          "LIMIT ?", [value]
        end
      end
    end
  end
end
