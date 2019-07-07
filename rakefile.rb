require_relative 'domain'


namespace 'posts' do
  desc "Get all posts"
  task :all do
    p POST_REPO.all
  end
end

