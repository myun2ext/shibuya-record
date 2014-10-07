require 'shibuya_record/query_generators/where'

describe ShibuyaRecord::QueryGenerators::Where do
  let(:where_class) { ShibuyaRecord::QueryGenerators::Where }
  let(:where) { where_class.generate(conditions) }
  let(:query_string) { where[0] }
  let(:values) { where[1] }

  context "new instance" do
    let(:conditions) { { huga: 3, hoge: "XYZ" } }
    it { expect(query_string).to eq " WHERE huga = ? AND hoge = ?" }
    it { expect(values).to eq [3, "XYZ"] }
  end
end
