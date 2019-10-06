class PostSearchService

  # @method: to filter posts by title | params: current_posts[Post], query[String]
  # return Posts
  def self.search(curr_posts, query)
    # {k => v} | trade off
    posts_ids = Rails.cache.fetch("posts_search/#{query}", expires_in: 1.hours) do
      curr_posts.where("title like '%#{query}%'").map(&:id)
    end

    curr_posts.where(id: posts_ids)
  end

end