require 'shibuya_record/query_generators/insert'

describe ShibuyaRecord::QueryGenerators::Insert do
  let(:generator) { ShibuyaRecord::QueryGenerators::Insert }
  let(:insert) { generator.generate(params) }
  let(:query_string) { insert[0] }
  let(:values) { insert[1] }

  context "" do
    let(:params) do
      {
        table_name: :hoge,
        values: { piyo: 3, foo: "Boom!" }
      }
    end
    it { expect(query_string).to eq \
         "INSERT INTO hoge (piyo, foo) VALUES (?, ?)" }
    it { expect(values).to eq [3, "Boom!"] }
  end
end
