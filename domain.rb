require 'rom'
require 'rom-sql'
require 'rom-repository'

require_relative 'config'

module Entities
  class Post
    attr_accessor :id, :slug, :content

    def initialize(id: nil, slug:, content:)
      @id = id
      @slug = slug
      @content = content
    end

    def long_content?
      content.size > 50
    end

    def persisted?
      !id.nil?
    end

    def ==(other)
      id == other.id
    end
  end
end

module Repositories
  class Posts < ROM::Repository[:posts]
    commands delete: :by_pk

    def create(slug:, content:)
      posts
        .map_to(Entities::Post)
        .command(:create)
        .call(slug: slug, content: content)
    end

    def get(id)
      posts.by_pk(id).map_to(Entities::Post).one
    end

    def all
      posts.map_to(Entities::Post).to_a
    end

    def get_slug_including(needle)
      posts
        .slug_includes(needle)
        .map_to(Entities::Post)
        .to_a
    end
  end
end

module Relations
  class Posts < ROM::Relation[:sql]
    schema(:posts, infer: true)

    def with_slug_including(needle)
      where { slug.ilike("%#{needle}%") }
    end

    def without_content(regex)
      exclude(content: regex)
    end
  end
end
ROM_CONFIGURATION.register_relation(Relations::Posts)

rom = ROM.container(ROM_CONFIGURATION)
POST_REPO = Repositories::Posts.new(rom)
