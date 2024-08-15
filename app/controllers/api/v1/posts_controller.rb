class Api::V1::PostsController < ApplicationController
  def index
    @posts = Post.all
    render json: { posts: PostBlueprint.render(@posts) }
  end
end
