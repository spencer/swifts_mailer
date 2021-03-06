require 'spec_helper'

describe HtmlSource do
  let(:match_details) { MatchDetails.new('spec/files/config.yml')}
  let(:html) { HtmlSource.new(match_details) }
  it "reads the html file in" do
    expect(html.body).to match(/<h2>12th October - Home to Fordingbridge/)
  end
end
