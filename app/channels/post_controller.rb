class PostController < ApplicationController
    def index
      render json: {api: 'OK'}, status: :ok
    end
end