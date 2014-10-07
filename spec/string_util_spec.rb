require 'shibuya_record/string_util'

describe ShibuyaRecord::StringUtil do
  describe ".underscore" do
    let(:camelized) { "HogeHuga" }
    subject(:underscore) { ShibuyaRecord::StringUtil.underscore(camelized) }
    it { expect(underscore).to eq "hoge_huga" }
  end

  describe ".pluralize" do
    subject(:plural) { ShibuyaRecord::StringUtil.pluralize(singular) }
    context "-s string" do
      let(:singular) { "pass" }
      it { expect(plural).to eq "passes" }
    end

    context "-y string" do
      let(:singular) { "city" }
      it { expect(plural).to eq "cities" }
    end

    context "-x string" do
      let(:singular) { "mix" }
      it { expect(plural).to eq "mixes" }
    end

    context "-sh string" do
      let(:singular) { "bash" }
      it { expect(plural).to eq "bashes" }
    end

    context "-ch string" do
      let(:singular) { "batch" }
      it { expect(plural).to eq "batches" }
    end
  end
end
