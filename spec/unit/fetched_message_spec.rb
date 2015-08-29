require 'spec_helper'

RSpec.describe FetchedMessage do
  let(:mts)  { FetchedMessage.new("hello_topic", "Hello World", "key", 0) }
  let(:hash) do
    { topic: "hello_topic", value: "Hello World", key: "key", offset: 0 }
  end

  it "provides access to topic,value,key,offset" do
    expect(mts.topic).to eq("hello_topic")
    expect(mts.value).to eq("Hello World")
    expect(mts.key).to eq("key")
    expect(mts.offset).to eq(0)
  end

  describe "#to_h" do
    subject { mts.to_h }

    it "converts the message to hash" do
      expect(subject).to eql(hash)
    end
  end

  describe "#to_hash" do
    subject { mts.to_hash }

    it "converts the message to hash" do
      expect(subject).to eql(hash)
    end
  end
end
