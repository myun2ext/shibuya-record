require 'shibuya_record/base'

describe ShibuyaRecord::Base do
  before do
    module Shibuya
      class City < ShibuyaRecord::Base; end
    end
  end
  it { expect(Shibuya::City.table_name).to eq "shibuya_cities" }
end
