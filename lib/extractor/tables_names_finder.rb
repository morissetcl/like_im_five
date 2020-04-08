require_relative './similarity_table_checker'

class TablesNamesFinder
  attr_reader :schema_tables, :attributes

  def initialize(args)
    @schema_tables = args[:schema_tables]
    @attributes = args[:attributes]
  end

  def call
    collecte_tables_names
  end

  private

  def collecte_tables_names
    tables_names = []
    attributes.select do |column|
      next unless column.include?("_id")

      table_name = column.split("_id").join.pluralize
      table = find_related_table(table_name)
      next if table.kind_of?(Array)

      tables_names << ["#{table}", column]
    end
    tables_names
  end

  def find_related_table(table_name)
    table_not_exist?(table_name) ? find_closest_table_name(table_name) : table_name
  end

  def table_not_exist?(table)
    !schema_tables.include?(table)
  end

  def find_closest_table_name(table)
    SimilarityTableChecker.call({table: table, schema_tables: schema_tables})
  end
end
