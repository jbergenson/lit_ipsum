# frozen_string_literal: true

module LitIpsum
  class Austen
    # Jane Austen's Sense and Sensibility
    class SenseAndSensibility < Base
      FILENAME = full_filename('texts/austen/sense-and-sensibility.txt')

      class << self
        def sentences(count, max_sentence: 0, repeats: nil)
          super(count, repeats: repeats, max_sentence: max_sentence, filename: FILENAME)
        end

        def words(count, repeats: nil)
          super(count, repeats: repeats, filename: FILENAME)
        end
      end
    end
  end
  # Shorthand Alias
  SenseAndSensibility = Austen::SenseAndSensibility
end
