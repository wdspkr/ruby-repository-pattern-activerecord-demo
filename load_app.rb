require 'rubygems'
require 'bundler/setup'

require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR)

# DB Setup
# drop
FileUtils.rm 'db/active_record_repo_demo.sqlite3'

# connect
ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    database: 'db/active_record_repo_demo.sqlite3',
)

# initialize
require_relative 'initialize_db'

# Load app
require_relative 'app/interest_repository'
require_relative 'app/interest_record'
require_relative 'app/interest'
require_relative 'app/account'
