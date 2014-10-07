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
      second_last = s[-2]

      case last_char
      when 's', 'x'
        return s + 'es'
      when 'y'
        if second_last =~ /[^aiueo]/
          return s[0..-2] + "ies"
        end
      end

      last_two_char = s[-2..-1]
      case last_two_char
      when 'sh', 'ch'
        return s + 'es'
      end

      s + 's'
    end
  end
end
