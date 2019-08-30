# frozen_string_literal: true

module LitIpsum
  class Doyle
    # Sir Arthur Conan Doyle's The Adventures of Sherlock Holmes
    class SherlockHolmes < Base
      FILENAME = full_filename('texts/doyle/the-adventures-of-sherlock-holmes.txt')

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
  SherlockHolmes = Doyle::SherlockHolmes
end
