require 'shibuya_record/validations/numericality'

describe ShibuyaRecord::Validations::Numericality do
  let(:validator) { ShibuyaRecord::Validations::Numericality.new }

  it { expect(validator.valid? nil).to eq false }
  it { expect(validator.valid? []).to eq false }
  it { expect(validator.valid?({})).to eq false }
  it { expect(validator.valid? "").to eq false }

  it { expect(validator.valid? 0).to eq true }
  it { expect(validator.valid? 3).to eq true }
  it { expect(validator.valid? 4.6).to eq true }
  it { expect(validator.valid? "3").to eq true }
  it { expect(validator.valid? "5.6").to eq true }
  it { expect(validator.valid? -3).to eq true }
  it { expect(validator.valid? -4.6).to eq true }
  it { expect(validator.valid? "-3").to eq true }
  it { expect(validator.valid? "-5.6").to eq true }

  it { expect(validator.valid? "-5.6a").to eq false }
  it { expect(validator.valid? "a4").to eq false }
end
