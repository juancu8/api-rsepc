require "rails_helper"
require "byebug"

RSpec.describe "Posts", type: :request do 

  describe "GET /posts" do
    it "should return OK" do
      get '/posts'
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end

    describe "Search" do
      let!(:hi) { create(:published_post, title: 'Hi') }
      let!(:pepe) { create(:published_post, title: 'Hi Pepe') }
      let!(:from) { create(:published_post, title: 'Arjonilla') }
  
      it "should filter posts by title" do
        get "/posts?search=Hi"
        payload = JSON.parse(response.body)
        expect(payload).to_not be_empty
        expect(payload.size).to eq(2)
        expect(payload.map{ |p| p["id"] }.sort).to eq([hi.id, pepe.id].sort)
        expect(response).to have_http_status(200)
      end
    end
  end

  describe "with data in the DB" do
    #Uses Factory_bot to generate posts, ! skip over lazzy evaluation
    let!(:posts) { create_list(:post, 10, published: true) }

    it "should return all the published posts" do
      get '/posts'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(posts.size)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/{id}" do
    let!(:post) { create(:post, published: true) }

    it "should return a post" do
      get "/posts/#{post.id}"
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to eq(post.id)
      expect(payload["title"]).to eq(post.title)
      expect(payload["content"]).to eq(post.content)
      expect(payload["published"]).to eq(post.published)
      expect(payload["author"]["name"]).to eq(post.user.name)
      expect(payload["author"]["email"]).to eq(post.user.email)
      expect(payload["author"]["id"]).to eq(post.user.id)
      expect(response).to have_http_status(200)
    end
  end

end