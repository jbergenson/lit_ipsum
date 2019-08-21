# frozen_string_literal: true

module LitIpsum
  class Doyle
    class SherlockHolmes < Base
      FILENAME = 'texts/doyle/the-adventures-of-sherlock-holmes.txt'
      attr_reader :size

      class << self
        def sentences(count, max_sentence = 0)
          source = max_sentence.zero? ? get_text(FILENAME) : get_text(FILENAME).select { |sentence| sentence.length <= max_sentence }
          obj = []
          count.times do
            sentence = source.sample
            obj << sentence
          end

          obj.join(' ')
        end

        def words(count)
          source = get_text(FILENAME).select { |sentence| sentence.scan(/\w+/).size <= count }
          obj = []
          loop do
            obj << source.select { |sentence| sentence.scan(/\w+/).size <= count - obj.map { |el| el.scan(/\w+/) }.flatten.length }.sample
            break if obj.map { |el| el.scan(/\w+/) }.flatten.length == count
          end
          obj.join(' ')
        end
      end
    end
  end
end
