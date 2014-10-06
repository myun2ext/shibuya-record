require 'shibuya_record/declaration'

module ShibuyaRecord
  class Base
    extend ShibuyaRecord::Declaration

    def initialize(*params)
      params = params.first
      if params
        self.class.record_attributes.each do |attribute|
          value = params[attribute.to_s] || params[attribute]
          self.send(attribute.to_s + "=", value)
        end
      end
    end
  end
end
