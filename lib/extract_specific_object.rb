require 'rails'
require 'active_record'
require 'erb'
require_relative './extract_associated_object'
require_relative './general_configuration'

class ExtractSpecificObject < GeneralConfiguration
  class << self
    def call(id:, table:)
      initialize_configuration
      return table_not_exist(table) unless ActiveRecord::Base.connection.tables.include?(table)

      result = ActiveRecord::Base.connection.execute("SELECT * FROM #{table} WHERE id='#{id}'").to_a
      return not_found(table, id) if result.blank?

      remove_timestamps(result)

      associated_object = [{ table: table, attributes: result }]
      ExtractAssociatedObject.new(result, associated_object).call
    end

    private

    def remove_timestamps(result)
      result[0].delete('updated_at')
      result[0].delete('created_at')
    end

    def not_found(table, id)
      print "Can't find id=#{id} in table=#{table}"
    end

    def table_not_exist(table)
      print "Table #{table} does not exist in your DB"
    end
  end
end
