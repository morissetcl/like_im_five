require 'rails'
require_relative '../create_factory'
require_relative './tables_names_finder'

class ExtractAssociatedObject
  attr_reader :attributes, :associated_object, :schema_tables

  def initialize(object, associated_object = [])
    @attributes = object[0]
    @associated_object = associated_object
    @schema_tables = ActiveRecord::Base.connection.tables
  end

  def call
    associated_tables_names.each do |table, column|
      id = attributes[column]
      next if id.nil?

      result = ActiveRecord::Base.connection.execute("SELECT * FROM #{table} WHERE id='#{id}'").to_a
      next if result.blank?

      GeneralConfiguration.remove_timestamps(result)
      associated_object << { table: table, attributes: result }
      ExtractAssociatedObject.new(result, associated_object).call
    end
    CreateFactory.call(associated_object)
  end

  private

  def associated_tables_names
    TablesNamesFinder.new({ attributes: attributes, schema_tables: schema_tables }).call
  end
end
