if require 'dalli'
  require 'shibuya_record/adapters/dalli'

  describe ShibuyaRecord::Adapters::Dalli do
    let(:adapter) { ShibuyaRecord::Adapters::Dalli.new }
    let(:set_value) { adapter.set("hoge", "huga") }
    let(:get_value) { adapter.get("hoge") }
    before do
      set_value
    end
    it { expect(get_value).to eq "huga" }
  end
end
