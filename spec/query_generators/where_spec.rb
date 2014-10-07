require 'shibuya_record/query_generators/where'

describe ShibuyaRecord::QueryGenerators::Where do
  let(:where_class) { ShibuyaRecord::QueryGenerators::Where }
  let(:where) { where_class.generate(conditions) }
  let(:query_string) { where[0] }
  let(:values) { where[1] }

  context "conditions" do
    let(:conditions) { { huga: 3, hoge: "XYZ", foo: nil, bar: { not: nil }, piyo: { gt: 8 } } }
    it { expect(query_string).to eq \
         " WHERE huga = ? AND hoge = ? AND foo IS NULL AND bar IS NOT NULL AND piyo > ?" }
    it { expect(values).to eq [3, "XYZ", 8] }
  end
end
