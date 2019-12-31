require 'rails'
require "rubygems/text"
require_relative './create_factory'

class ExtractAssociatedObject
  attr_reader :object, :associated_object

  def initialize(object, associated_object = [])
    @object = object[0]
    @associated_object = associated_object
  end

  def call
    associated_tables_names.each do |table, column|
      value = object[column]
      next if value.nil?

      result = ActiveRecord::Base.connection.execute("SELECT * FROM #{table} WHERE id='#{value}'").to_a
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
      table_exist = ActiveRecord::Base.connection.tables.include?(table)
      if !table_exist
        ActiveRecord::Base.connection.tables.each do |table_name|
           levenshtein = Class.new.extend(Gem::Text).method(:levenshtein_distance)
           similarity = levenshtein.call(table, table_name)
           next if similarity > 3

           table = table_name
        end
      end

      tables_names << ["#{table}", column]
    end
    tables_names
  end
end
