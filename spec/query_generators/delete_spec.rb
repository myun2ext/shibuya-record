require 'shibuya_record/query_generators/delete'

describe ShibuyaRecord::QueryGenerators::Delete do
  let(:generator) { ShibuyaRecord::QueryGenerators::Delete }
  let(:delete) { generator.generate(params) }
  let(:query_string) { delete[0] }
  let(:values) { delete[1] }

  context "Not specify where" do
    let(:params) { { table_name: "huga" } }
    it { expect(query_string).to eq "DELETE FROM huga" }
    it { expect(values).to eq [] }
  end

  context "specify where" do
    let(:params) do
      {
        table_name: :huga,
        where: { piyo: 3 }
      }
    end
    it { expect(query_string).to eq \
         "DELETE FROM huga WHERE piyo = ?" }
    it { expect(values).to eq [3] }
  end
end
