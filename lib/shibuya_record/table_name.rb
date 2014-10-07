require 'shibuya_record/string_util'

module ShibuyaRecord
  module TableName
    def table_name
      s = StringUtil.underscore(name)
      s.gsub!("::", "_")
      StringUtil.pluralize(s)
    end
  end
end
