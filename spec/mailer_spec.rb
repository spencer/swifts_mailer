require 'spec_helper'
require 'stringio'

describe Mailer do
  let(:config) {'spec/files/config.yml'}
  let(:test_mailer) {Mailer.new(['test@example.com', 'test2@example.com'],config)}
  it "needs a list of subscribers" do
    test_mailer.subscribers.should_not be nil
  end

  it "sends an email" do
    Pony.stub (:deliver)
    expect(Pony).to receive(:deliver)
    test_mailer.send_email('email', 'hello spec')
  end

  it "sends to each of subscribers" do
    Pony.stub (:deliver)
    expect(test_mailer).to receive(:send_email).twice
    test_mailer.send_to_list
  end

  it "prints each email to the terminal as it sends" do
    Pony.stub (:deliver)
    @output = StringIO.new
    test_mailer.output = @output
    test_mailer.send_email('email', 'hello spec')
    expect(@output.string).to include "email [SENT]"
  end

  it "Previews the email" do
    Pony.stub (:deliver)
    test_mailer.preview
  end
end
