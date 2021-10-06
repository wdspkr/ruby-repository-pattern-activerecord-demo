require 'rubygems'
require 'bundler/setup'

require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    database: 'db/active_record_repo_demo.sqlite3',
)

require_relative 'interest_repository'
require_relative 'interest_record'
require_relative 'interest'
require_relative 'account'
