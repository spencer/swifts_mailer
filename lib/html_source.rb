class HtmlSource
  require 'tilt/erb'
  attr_reader :body

  def initialize(match_details, file='body.html.erb')
    template_file = File.join(File.dirname(__FILE__),'..', file)
    template = Tilt::ERBTemplate.new(template_file)
    @body = template.render(match_details)
  end
end
