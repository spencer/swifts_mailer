class Mailer
  attr_accessor :output
  attr_reader :subscribers, :html, :match_details

  def initialize(subscribers=IO.readlines('subscriber_list.txt').map!{|e| e.strip!}, config='config.yml')
    @subscribers = subscribers
    @match_details = MatchDetails.new(config)
    @html = HtmlSource.new(@match_details)
    
    @output = $stdout
  end

  def send_email(email, subject="Swifts Match Report")
    Pony.mail(
      :to => email,
      :from => 'spencer.turner@gmail.com',
      :subject => subject,
      :html_body => @html.body,
      :body => 'Swifts Email View as HTML',
    )
    write_progress(email)
  end

  def send_to_list
    @subscribers.each do |subscriber| 
      send_email(subscriber)
    end
  end

  def write_progress(email)
    output.puts email.to_s + " [SENT]"
  end

  def preview
    html = HtmlSource.new(@match_details)
    File.open('preview.html', 'w') { | file|  file.write (html.body) }
  end
end
