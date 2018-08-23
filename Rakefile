require 'yaml'
require 'sqlite3'
require 'active_record'

namespace :db do
  db_config = YAML::load(File.open('config/database.yml'))

  desc "Migrate the database"
  task :migrate do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::Migrator.migrate("db/migrate/")
    puts "Database migrated."
  end

  desc "Seed the database"
  task :seed do
    ActiveRecord::Base.establish_connection(db_config)
    load("db/seed.rb")
  end
end
