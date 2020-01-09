require 'rails'
require "rubygems/text"
require_relative './create_factory'

class ExtractAssociatedObject
  attr_reader :object, :associated_object, :schema_tables

  def initialize(object, associated_object = [])
    @object = object[0]
    @associated_object = associated_object
    @schema_tables = ActiveRecord::Base.connection.tables
  end

  def call
    associated_tables_names.each do |table, column|
      value = object[column]
      next if value.nil?

      result = ActiveRecord::Base.connection.execute("SELECT * FROM #{table} WHERE id='#{value}'").to_a
      next if result.blank?

      result[0].delete('updated_at')
      result[0].delete('created_at')
      associated_object << { table: table, attributes: result }
      ExtractAssociatedObject.new(result, associated_object).call
    end
    CreateFactory.call(associated_object)
  end

  private

  def associated_tables_names
    tables_names = []
    object.select do |column|
      next unless column.include?("_id")

      table = column.split("_id").join.pluralize
      if table_not_exist?(table)
        table = find_closest_table_name(table)
      end
      next if table.kind_of?(Array)

      tables_names << ["#{table}", column]
    end
    tables_names
  end

  def table_not_exist?(table)
    !schema_tables.include?(table)
  end

  def find_closest_table_name(table)
    schema_tables.each do |table_name|
      levenshtein = Class.new.extend(Gem::Text).method(:levenshtein_distance)
      similarity = levenshtein.call(table, table_name)
      return table_name if similarity < 3
      return table_name if table_name.split('_').include?(table)
    end
  end
end
