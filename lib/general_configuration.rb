class GeneralConfiguration
  class << self
    def initialize_configuration
      db_config = YAML.load(ERB.new(File.read('./config/database.yml')).result)
      connect_database(db_config)
    end

    private

    def connect_database(db_config)
      if Rails.env.test?
        ActiveRecord::Base.establish_connection(db_config['test'])
      else
        ActiveRecord::Base.establish_connection(db_config['development'])
      end
    end
  end
end
