require 'shibuya_record/query_generators/ddl/create_index'

describe ShibuyaRecord::QueryGenerators::Ddl::CreateIndex do
  let(:generator) { ShibuyaRecord::QueryGenerators::Ddl::CreateIndex }
  let(:query_string) { generator.generate(params) }

  context "create index" do
    let(:params) { { table_name: "hoge", columns: [:foo, :bar] } }
    it { expect(query_string).to eq "CREATE INDEX index_hoge_on_foo_and_bar ON hoge (foo, bar)" }
  end

  context "create unique index" do
    let(:params) { { table_name: "hoge", columns: [:foo, :bar] } }
    let(:in_unique_query_string) { generator.unique(params) }
    it { expect(in_unique_query_string).to eq "CREATE UNIQUE INDEX index_hoge_on_foo_and_bar ON hoge (foo, bar)" }
  end

  describe "generate index name" do
    let(:index_name) { generator.index_name(params) }
    let(:params) { { table_name: "hoge", columns: [:foo, :bar] } }
    it { expect(index_name).to eq "index_hoge_on_foo_and_bar" }
  end
end
