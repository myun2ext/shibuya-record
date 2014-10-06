module ShibuyaRecord
  module StringUtil
    def self.underscore(s)
      s.gsub(/::/, '/').
        gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
        gsub(/([a-z\d])([A-Z])/,'\1_\2').
        tr("-", "_").
        downcase
    end

    def self.pluralize(s)
      last_char = s[-1]
      if last_char == 'i'
        return s[0..-2] + "es"
      end
      if last_char == 'e'
        return s + 'es'
      end
      s + 's'
    end
  end
end
