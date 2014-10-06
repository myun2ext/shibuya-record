require 'shibuya_record/validations/numericality'

describe ShibuyaRecord::Validations::Numericality do
  context "not present options." do
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
       # format, greater_than, less_than, greater_than_or_equal_to
       # less_than_or_equal_to, equal_to
  context "with" do
    let(:validator) { ShibuyaRecord::Validations::Numericality.new(option) }

    context "greater than" do
      let(:option) { { :greater_than => 3 } }

      it { expect(validator.valid? nil).to eq false }
      it { expect(validator.valid? []).to eq false }
      it { expect(validator.valid?({})).to eq false }
      it { expect(validator.valid? "").to eq false }

      it { expect(validator.valid? 0).to eq false }
      it { expect(validator.valid? 3).to eq false }
      it { expect(validator.valid? 6).to eq true }
      it { expect(validator.valid? 4.6).to eq true }
      it { expect(validator.valid? 1.6).to eq false }
      it { expect(validator.valid? "3").to eq false }
      it { expect(validator.valid? "6").to eq true }
      it { expect(validator.valid? "5.6").to eq true }
      it { expect(validator.valid? -3).to eq false }
      it { expect(validator.valid? -4.6).to eq false }
      it { expect(validator.valid? "-3").to eq false }
      it { expect(validator.valid? "-5.6").to eq false }

      it { expect(validator.valid? "-5.6a").to eq false }
      it { expect(validator.valid? "a4").to eq false }
    end
  end
end
