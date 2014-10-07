require 'shibuya_record/query_generators/join'

describe ShibuyaRecord::QueryGenerators::Join do
  let(:generator) { ShibuyaRecord::QueryGenerators::Join }
  let(:join) { generator.generate(params) }
  let(:query_string) { join[0] }
  let(:values) { join[1] }

  context "specify columns and where conditions" do
    let(:params) do
      {
        type: "LEFT OUTER",
        table_name: :hoge,
        on: { piyo: 3, foo: "Boom!" }
      }
    end
    it { expect(query_string).to eq \
         "LEFT OUTER JOIN hoge ON piyo = ? AND foo = ?" }
    it { expect(values).to eq [3, "Boom!"] }
  end
end
