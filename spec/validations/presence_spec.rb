require 'shibuya_record/validations/presence'

describe ShibuyaRecord::Validations::Presence do
  let(:validator) { ShibuyaRecord::Validations::Presence.new }

  it { expect(validator.valid? nil).to eq false }
  it { expect(validator.valid? []).to eq false }
  it { expect(validator.valid?({})).to eq false }
  it { expect(validator.valid? "").to eq false }
  it { expect(validator.valid? "a").to eq true }
  it { expect(validator.valid? 4).to eq true }
end
