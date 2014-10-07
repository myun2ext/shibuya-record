require 'shibuya_record/query_generators/select'

describe ShibuyaRecord::QueryGenerators::Select do
  let(:generator) { ShibuyaRecord::QueryGenerators::Select }
  let(:select) { generator.generate(params) }
  let(:query_string) { select[0] }
  let(:values) { select[1] }

  context "All record, All columns (no where, no specify columns)" do
    let(:params) { { table_name: "huga" } }
    it { expect(query_string).to eq "SELECT * FROM huga" }
    it { expect(values).to eq [] }
  end

  context "specify columns and where conditions" do
    let(:params) do
      {
        table_name: :hoge,
        columns: [:fizz, :buzz],
        where: { piyo: 3, foo: "Boom!" }
      }
    end
    it { expect(query_string).to eq \
         "SELECT fizz, buzz FROM hoge WHERE piyo = ? AND foo = ?" }
    it { expect(values).to eq [3, "Boom!"] }
  end
end
