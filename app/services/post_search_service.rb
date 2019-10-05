class PostSearchService

  # @method: to filter posts by title | params: current_posts[Post], query[String]
  # return Posts
  def self.search(current_posts, query)
    current_posts.where("title like '%#{query}%'")
  end

end