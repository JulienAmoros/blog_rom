require 'irb'

require_relative 'domain'

# Business layer
p "Try something like `POST_REPO.create(slug: 'toto', content: 'titi')`"
p "or: `POST_REPO.get(1)`"

IRB.start
