require 'shibuya_record/query_generators/ddl/alter_table'

describe ShibuyaRecord::QueryGenerators::Ddl::AlterTable do
  let(:generator) { ShibuyaRecord::QueryGenerators::Ddl::AlterTable }

  context "Add column" do
    let(:alter_table_query) { generator.add_column(:hoge, column_name: :foo, type: "VARCHAR(255)") }
    it { expect(alter_table_query).to eq \
      "ALTER TABLE hoge ADD COLUMN foo VARCHAR(255)" }
  end

  context "Rename column" do
    let(:alter_table_query) { generator.rename_column(:hoge, from_column: :foo, to_column: :bar) }
    it { expect(alter_table_query).to eq \
      "ALTER TABLE hoge RENAME COLUMN foo TO bar" }
  end

  context "Drop column" do
    let(:alter_table_query) { generator.drop_column(:hoge, column_name: :foo) }
    it { expect(alter_table_query).to eq \
      "ALTER TABLE hoge DROP COLUMN foo" }
  end
end
