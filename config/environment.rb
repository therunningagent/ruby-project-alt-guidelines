require 'bundler'
Bundler.require

## how to connect to database

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

# do I need sql?

ActiveRecord::Base.logger = nil
require_all 'lib'
