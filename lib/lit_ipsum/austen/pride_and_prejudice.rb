# frozen_string_literal: true

module LitIpsum
  class Austen
    # Jane Austen's Pride and Prejudice
    class PrideAndPrejudice < Base
      FILENAME = full_filename('texts/austen/pride-and-prejudice.txt')

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
  PrideAndPrejudice = Austen::PrideAndPrejudice
end
