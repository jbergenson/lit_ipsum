# frozen_string_literal: true

module LitIpsum
  class Dickens
    # Charles Dickens' Oliver Twist
    class OliverTwist < Base
      FILENAME = full_filename('texts/dickens/oliver-twist.txt')

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
  OliverTwist = Dickens::OliverTwist
end
