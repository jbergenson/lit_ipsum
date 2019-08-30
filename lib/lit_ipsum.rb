# frozen_string_literal: true

require 'lit_ipsum/version'

module LitIpsum
  SENTENCE_PATTERN = /(?=“*)[A-Z]+.{1,}?[\.\!\?](?=”*\s*)(?<!Mr.|Mrs.|Ms.|Dr.|St.|S.A.)/

  # Generic error class that can be raised when an exception is expected
  class Error < StandardError; end

  class Base
    class << self
      def get_text(filename)
        File.open(filename, 'r') do |file|
          return file.map(&:chomp)
                     .reject { |line| line.empty? || line.start_with?('#') }
                     .map { |line| line.delete('_') }
                     .join(' ')
                     .scan(SENTENCE_PATTERN)
                     .uniq
        end
      end

      def sentences(count, max_sentence:, filename:, repeats:)
        source = max_sentence.zero? ? get_text(filename) : get_text(filename).select { |sentence| sentence.length <= max_sentence }
        raise Error, "Unable to find sentences of length <= #{max_sentence}." if source.empty?

        obj = []
        count.times { obj << source.sample }

        repeat(repeats, obj)
      end

      def words(count, filename:, repeats:)
        source = get_text(filename).select { |sentence| sentence.scan(/\w+/).size <= count }
        obj = []
        loop do
          length_in_words = obj.map { |el| el.scan(/\w+/) }.flatten.length
          obj << source.select { |sentence| sentence.scan(/\w+/).size <= count - length_in_words }.sample
          break if length_in_words == count
        end

        repeat(repeats, obj)
      end

      private

      def repeat(repeats, obj)
        phrases = []
        if !repeats.nil?
          repeats.times { phrases << obj.join(' ') }
          phrases.join("\n")
        else
          obj.join(' ')
        end
      end

      def full_filename(txt)
        File.join(File.dirname(File.expand_path(__FILE__)), txt)
      end
    end
  end
end

# require objects
Dir.glob(File.join(File.dirname(__FILE__), 'lit_ipsum', '/**/*.rb')).sort.each { |file| require file }
