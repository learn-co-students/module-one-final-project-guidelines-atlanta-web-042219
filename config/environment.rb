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

# enable / disable logger
# ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger = nil
