# frozen_string_literal: true

require 'lit_ipsum/version'

module LitIpsum
  SENTENCE_PATTERN = /(?=“*)[A-Z]+.{1,}?[\.\!\?](?=”*\s*)(?<!Mr.|Mrs.|Ms.|Dr.|St.|S.A.)/.freeze

  class Error < StandardError; end
  def self.hello
    'Hello, Friend.'
  end

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
    end
  end
end

# require objects
Dir.glob(File.join(File.dirname(__FILE__), 'lit_ipsum', '/**/*.rb')).sort.each { |file| require file }
