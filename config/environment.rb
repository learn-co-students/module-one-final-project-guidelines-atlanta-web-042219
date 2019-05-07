require 'bundler/setup'
Bundler.require

require_all 'app'
# require 'rest-client'
require 'json'
require 'colorize'


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/development.sqlite'
)

#we can copy/paste this into pry to see the SQL code that is being executed when we use ActiveRecord methods.
# ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = nil
