require 'spec_helper'

describe 'MatchDetails' do
  let(:config) {'spec/files/config.yml'}
  let(:match_details) { MatchDetails.new(config) }

  it "reads a config file" do
    expect(match_details.details).to_not be nil
  end

  it "has everything set" do
    expect(match_details.details['home_or_away']).to eq "home"
    expect(match_details.details['date']).to eq "12th October"
    expect(match_details.details['opponents']).to eq "Fordingbridge"
    expect(match_details.details['photo_count']).to eq 18
    expect(match_details.details['body_copy']).to eq "Some content here"
    expect(match_details.details['motm']).to eq "James Winson"
    expect(match_details.details['score']).to eq "10-0"
    expect(match_details.details['goal_scorers']).to eq [{"name"=>"Dylan", "goals"=>3}, {"name"=>"James", "goals"=>1}]
  end

  it "generates image_tags" do
    expect(match_details.image_tag(1)).to eq '<img style="width: 100%; height: auto;" src="https://dl.dropboxusercontent.com/u/1111111/fordingbridge_121013/F1.jpg">'
  end

  it "substitutes spaces in image tag" do
    match_details.details['opponents'] = 'simply soccer'
    expect(match_details.image_tag(1)).to include('simply_soccer_121013')
  end
end
