class MatchDetails
  attr_reader :details
  def initialize(config='config.yml')
    @details = YAML::load_file(File.join(__dir__,'..', config))
  end

  def image_tag(index)
    '<img style="width: 100%; height: auto;" src="https://dl.dropboxusercontent.com/u/' +
    details['dropbox_code'] +
    '/' +
    details['opponents'].downcase +
    '_' +
    details['folder_date'] +
    '/' +
    details['opponents'].chars[0].upcase +
    index.to_s +
    '.jpg">'
  end
end
