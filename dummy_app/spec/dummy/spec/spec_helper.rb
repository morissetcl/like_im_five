ENV['RAILS_ENV'] ||= 'development'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rake'
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  Rails.application.load_tasks
  config.before(:suite) do
    Rake::Task['db:reset'].invoke
  end
  config.after(:suite) do
    Rake::Task['db:drop'].invoke
  end
end
