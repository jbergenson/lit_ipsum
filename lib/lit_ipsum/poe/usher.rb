# frozen_string_literal: true

module LitIpsum
  class Poe
    # Edgar Allen Poe's The Fall of House Usher
    class Usher < Base
      FILENAME = full_filename('texts/poe/the-fall-of-house-usher.txt')

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
  Usher = Poe::Usher
end
