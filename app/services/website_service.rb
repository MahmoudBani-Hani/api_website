class WebsiteService
  def initialize(website)
    Rails.logger.info "Initializing WebsiteService for website: #{website.uuid}"
    @website = Website.find_by(uuid: website.uuid)
    raise "Website with uuid #{website.uuid} not found" unless @website
    @template = @website.template
    raise "Template with id #{@website.template_id} not found" unless @template
  end

  def call
    {
      template: {
        name: @template.name
      },
      details: {
        name: @website.name,
        url: @website.url,
        status: @website.status
      }
    }
  end
end
