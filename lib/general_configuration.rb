class GeneralConfiguration
  def self.initialize_configuration
    db_config = YAML.load(ERB.new(File.read('./config/database.yml')).result)
    ActiveRecord::Base.establish_connection(db_config['development'])
  end
end
