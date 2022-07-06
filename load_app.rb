require 'rubygems'
require 'bundler/setup'

require 'active_record'
require 'pry'

ActiveRecord::Base.logger = Logger.new(STDERR)

# DB Setup
# drop
DB = 'db/active_record_repo_demo.sqlite3'
FileUtils.rm DB if File.file?(DB)

# connect
ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    database: DB,
)

# initialize
require_relative 'initialize_db'

# Load app
require_relative 'app/interest_repository'
require_relative 'app/interest_record'
require_relative 'app/interest'
require_relative 'app/account'
