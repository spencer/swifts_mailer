require 'spec_helper'

describe 'MatchDetails' do
  let(:config) {'spec/files/config.yml'}
  let(:match_details) { MatchDetails.new(config) }

  it "reads a config file" do
    match_details.details.should_not be nil
  end

  it "has everything set" do
    match_details.details['home_or_away'].should == "home"
    match_details.details['date'].should == "12th October"
    match_details.details['opponents'].should == "Fordingbridge"
    match_details.details['photo_count'].should == 18
    match_details.details['body_copy'].should == "Some content here"
    match_details.details['motm'].should == "James Winson"
    match_details.details['score'].should == "10-0"
    match_details.details['goal_scorers'].should == [{"name"=>"Dylan", "goals"=>3}, {"name"=>"James", "goals"=>1}]
  end

  it "generates image_tags" do
    match_details.image_tag(1).should == '<img style="width: 100%; height: auto;" src="https://dl.dropboxusercontent.com/u/1111111/fordingbridge_121013/F1.jpg">'

  end
end
