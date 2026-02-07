class Api::V1::Microposts::UploadUrlsController < ApplicationController
  def show
    micropost = Micropost.new(micropost_params.to_h.symbolize_keys)
    render json: { url: micropost.upload_url }
  end

  private

  def micropost_params
    params.require(:micropost).permit(:filename, :content_type)
  end
end
