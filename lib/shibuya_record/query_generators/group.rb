module ShibuyaRecord
  module QueryGenerators
    class Group
      def self.group(column)
        "GROUP BY #{column}"
      end
    end
  end
end
