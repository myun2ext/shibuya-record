require 'shibuya_record/query_generators/ddl/create_table'

describe ShibuyaRecord::QueryGenerators::Ddl::CreateTable do
  let(:generator) { ShibuyaRecord::QueryGenerators::Ddl::CreateTable }
  let(:query) { generator.generate(params) }

  context "create" do
    let(:params) do
      {
        table_name: :users,
        columns: [
          { name: :id, type: :int, auto_increment: true },
          { name: :name, type: :string, not_null: true },
          { name: :hoge, type: :string, length: 20 },
          { name: :huga, type: :char, length: 20 },
        ]
      }
    end

    let(:expected_query) do
      s = <<-EOS
         CREATE TABLE users (
           id INT AUTO_INCREMENT , 
           name VARCHAR NOT NULL , 
           hoge VARCHAR(20) , 
           huga CHAR(20) 
         )
      EOS
      s.gsub!(/\A\s+/, "")
      s.gsub!(/\n\s+/, "")
      s.gsub!(/\s+\z/, "")
    end
    it { expect(query).to eq expected_query }
  end
end
