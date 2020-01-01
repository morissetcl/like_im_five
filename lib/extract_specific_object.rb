require 'rails'
require 'active_record'
require 'erb'
require_relative './extract_associated_object'

class ExtractSpecificObject
  class << self
    def call(id:, model:)
      initialize_configuration
      return table_not_exist(model) unless ActiveRecord::Base.connection.tables.include?(model)

      result = ActiveRecord::Base.connection.execute("SELECT * FROM #{model} WHERE id='#{id}'").to_a
      return not_found(model, id) if result.blank?

      remove_timestamps(result)
      ExtractAssociatedObject.new(result).call
    end

    private

    def remove_timestamps(result)
      result[0].delete('updated_at')
      result[0].delete('created_at')
    end

    def initialize_configuration
      db_config = YAML.load(ERB.new(File.read('./config/database.yml')).result)
      ActiveRecord::Base.establish_connection(db_config['development'])
    end

    def not_found(model, id)
      print "Can't find id=#{id} in table=#{model}"
    end

    def table_not_exist(model)
      print "Table #{model} does not exist in your DB"
    end
  end
end
