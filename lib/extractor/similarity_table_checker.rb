class SimilarityTableChecker
  class << self
    def call(args)
      find_table(args[:schema_tables], args[:table])
    end

    private

    def find_table(schema_tables, table)
      schema_tables.each do |table_name|
        levenshtein = Class.new.extend(Gem::Text).method(:levenshtein_distance)
        similarity = levenshtein.call(table, table_name)
        return table_name if similarity < 3
        return table_name if table_name.split('_').include?(table)
      end
    end
  end
end
