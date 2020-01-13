class GeneralConfiguration
  class << self
    def initialize_configuration
      if Rails.env.test?
        connect_database('test', "/dummy_app")
      else
        connect_database('development', "")
      end
    end

    private

    def connect_database(env, path)
      db_config = YAML.load(ERB.new(File.read(".#{path}/config/database.yml")).result)
      ActiveRecord::Base.establish_connection(db_config[env])
    end
  end
end
