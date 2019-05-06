require 'bundler/setup'
require_relative '../gif.rb'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'


ActiveRecord::Base.logger = Logger.new(STDOUT)

require_all 'app'
