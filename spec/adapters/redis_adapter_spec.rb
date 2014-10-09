if require 'redis'
  require 'shibuya_record/adapters/redis'

  describe ShibuyaRecord::Adapters::Redis do
    let(:adapter) { ShibuyaRecord::Adapters::Redis.new }
    let(:set_redis_value) { adapter.set("hoge", "huga") }
    let(:get_redis_value) { adapter.get("hoge") }
    before do
      set_redis_value
    end
    it { expect(get_redis_value).to eq "huga" }
  end
end
