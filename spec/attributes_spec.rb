require 'shibuya_record/base'

describe ShibuyaRecord::Attributes do
  before do
    class MockClass < ShibuyaRecord::Base
      attributes :hoge, :huga
    end
  end

  context "new instance" do
    let(:mock_object) { MockClass.new(hoge: 3, huga: "hoge") }
    it { expect(mock_object.hoge).to eq 3 }
    it { expect(mock_object.huga).to eq "hoge" }

    context "update attribute" do
      before do
        mock_object.hoge = 4
        mock_object.huga = "huga"
      end
      it { expect(mock_object.hoge).to eq 4 }
      it { expect(mock_object.huga).to eq "huga" }
    end
  end

  context "new instance(no params)" do
    let(:mock_object) { MockClass.new }
    it { expect(mock_object.hoge).to be_nil }
    it { expect(mock_object.huga).to be_nil }
  end
end
