require 'rom'

db_config = {
  adapter: 'mysql2',
  database: 'blog',
  host: 'localhost',
  username: 'root',
  port: 3306
}

ROM_CONFIGURATION = ROM::Configuration.new(:sql, db_config)
