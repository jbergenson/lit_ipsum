# frozen_string_literal: true

module LitIpsum
  class Carroll
    # Lewis Carroll's Alice's Adventures in Wonderland
    class AliceInWonderland < Base
      FILENAME = full_filename('texts/carroll/alice-in-wonderland.txt')

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
  AliceInWonderland = Carroll::AliceInWonderland
end
