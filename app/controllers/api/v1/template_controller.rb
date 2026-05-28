class Api::V1::TemplateController < ApplicationController
  before_action :set_template, only: %i[show]
  def index
    templates = Template.all
    render json: { templates: templates.includes(:template_pages),  status: :ok }
  end

  def show
    render json: @template,
           include: {
             template_pages: {
               include: {
                 template_sections: {
                   include: :template_components
                 }
               }
             }
           }
  end


  private
  def set_template
    begin
      @template = Template.find(params[:id].to_i)
    rescue => e
      render json: { error: "Template not found" }, status: :not_found
    end
  end
end
