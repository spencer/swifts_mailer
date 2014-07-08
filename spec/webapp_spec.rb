require 'spec_helper'

describe "My Sinatra Application" do
  it "should allow accessing the home page" do
    get '/'
    last_response.should be_ok
  end
  it "should allow accessing the preview page" do
    get '/preview'
    last_response.should be_ok
  end
end
