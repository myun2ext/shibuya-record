require 'shibuya_record/adapters/mongo'

describe ShibuyaRecord::Adapters::Mongo do
  let(:adapter) { ShibuyaRecord::Adapters::Mongo.new(database: :shibuya_record_test) }
  let(:set_value) { adapter.insert(:foo_collection, { :hoge => "huga" }) }
  let(:get_value) { adapter.where(:foo_collection, { :hoge => "huga" }) }
  before do
    set_value
  end
  it { expect(get_value.first["hoge"]).to eq "huga" }
end
