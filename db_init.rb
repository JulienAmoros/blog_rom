require_relative 'config'

# ROM_CONFIGURATION.default.drop_table :posts
# ROM_CONFIGURATION.default.drop_table :tags

# Migrations
ROM_CONFIGURATION.default.create_table :posts do
  primary_key :id
  column :slug, String, null: false
  column :content, String, null: false
end

# ROM_CONFIGURATION.default.create_table :tags do
#   primary_key :id
#   column :name, String, null: false
# end
