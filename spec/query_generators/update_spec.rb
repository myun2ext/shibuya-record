require 'shibuya_record/query_generators/update'

describe ShibuyaRecord::QueryGenerators::Update do
  let(:generator) { ShibuyaRecord::QueryGenerators::Update }
  let(:update) { generator.generate(params) }
  let(:query_string) { update[0] }
  let(:values) { update[1] }

  context "Not specify where" do
    let(:params) { { table_name: "huga", set: { hoge: 6 } } }
    it { expect(query_string).to eq "UPDATE huga SET hoge = ?" }
    it { expect(values).to eq [6] }
  end

  context "specify where" do
    let(:params) do
      {
        table_name: :huga,
        set: { hoge: 6, piya: "Beee.." },
        where: { piyo: 3, foo: "Boom!" }
      }
    end
    it { expect(query_string).to eq \
         "UPDATE huga SET hoge = ?, piya = ? WHERE piyo = ? AND foo = ?" }
    it { expect(values).to eq [6, "Beee..", 3, "Boom!"] }
  end
end
