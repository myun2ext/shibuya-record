require 'shibuya_record/base'

describe ShibuyaRecord::Base do
  before do
    class MockClass < ShibuyaRecord::Base
      attributes :hoge, :huga
    end
  end
end
