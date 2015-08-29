module Poseidon

  # A message fetched from a Kafka broker.
  #
  # ```
  # fetched_messages = consumer.fetch
  # fetched_messages.each do |fm|
  #   puts "Topic: #{fm.topic}"
  #   puts "Value #{fm.value}"
  #   puts "Key: #{fm.key}"
  #   puts "Offset: #{fm.offset}"
  # end
  # ```
  #
  # @api public
  class FetchedMessage
    attr_reader :value, :key, :topic, :offset

    # Initializes the message
    #
    # @param [String] topic
    #   Topic this message fetched from.
    #
    # @param [String] value
    #   Value of the message.
    #
    # @param [String] key
    #   Message's key.
    #
    # @param [Integer] offset
    #   The offset of the message in a topic's partition.
    #
    # @api private
    def initialize(topic, value, key, offset)
      @topic  = topic
      @value  = value
      @key    = key
      @offset = offset
    end

    # Converts the message to a hash
    #
    # @return [Hash]
    #
    # @alias :to_hash
    #
    # @api public
    def to_h
      { topic: topic, key: key, value: value, offset: offset }
    end
    alias_method :to_hash, :to_h
  end
end
