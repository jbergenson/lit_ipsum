# frozen_string_literal: true

module LitIpsum
  class Poe
    # Edgar Allen Poe's The Raven
    class Raven < Base
      FILENAME = full_filename('texts/poe/the-raven.txt')

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
  Raven = Poe::Raven
end
