# Default require for load gem from Gemfile using Bundler
require "rubygems"
require "bundler/setup"

# Require gem and subfunction from gem like 'active_support/dependencies'
require 'erb'
require 'yaml'
require 'digest'
require 'bcrypt'
require 'readline'
require 'io/console'
require 'securerandom'
require 'active_record'
require 'terminal-table'
require 'active_support/all'

# Auto require all default gem from Bundler
Bundler.require(:default)

# Database Connections
connection_details = YAML::load(File.open('config/database.yml'))
ActiveRecord::Base.default_timezone = :local
ActiveRecord::Base.establish_connection(connection_details)
