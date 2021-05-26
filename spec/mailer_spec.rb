require 'spec_helper'
require 'stringio'

describe Mailer do
  let(:config) {'spec/files/config.yml'}
  let(:test_mailer) {Mailer.new(['test@example.com', 'test2@example.com'],config)}
  it "needs a list of subscribers" do
    expect(test_mailer.subscribers).not_to be nil
  end

  it "sends an email" do
    allow(Pony).to receive(:deliver)
    test_mailer.send_email('email', 'hello spec')
  end

  it "sends to each of subscribers" do
    allow(Pony).to receive(:deliver)
    allow(Pony).to receive(:send_email).twice
    test_mailer.send_to_list
  end

  it "prints each email to the terminal as it sends" do
    allow(Pony).to receive(:deliver)
    @output = StringIO.new
    test_mailer.output = @output
    test_mailer.send_email('email', 'hello spec')
    expect(@output.string).to include "email [SENT]"
  end

  it "Previews the email" do
    allow(Pony).to receive(:deliver)
    test_mailer.preview
  end
end
