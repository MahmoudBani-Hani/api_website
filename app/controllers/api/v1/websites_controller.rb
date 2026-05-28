class Api::V1::WebsitesController < ApplicationController
  before_action :set_website, only: %i[show]

  def show
    website = WebsiteService.new(@website).call
    render json: { website: website, status: :ok }
  end

  private
  def set_website
    begin
      @website = Website.find_by(uuid: params[:uuid])
    rescue => e
      render json: { error: "Website not found" }, status: :not_found
    end
  end
end
