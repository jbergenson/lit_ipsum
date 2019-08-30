# frozen_string_literal: true

require 'lit_ipsum/poe/raven'

RSpec.describe LitIpsum::Poe::Raven do
  before(:each) do |spec|
    @rand = rand(3..24) unless spec.metadata[:skip_before]
  end

  context 'with repetition' do
    it 'generates litsum from sentences' do
      3.times do
        expect(LitIpsum::Raven.sentences(@rand, repeats: @rand).is_a?(String)).to eq(true)
      end
    end

    it 'generates litsum with correct amount of sentences' do
      3.times do
        expect(LitIpsum::Raven.sentences(@rand, repeats: @rand).scan(LitIpsum::SENTENCE_PATTERN).size).to eq(@rand * @rand)
      end
    end

    it 'includes only sentences under or equal to maximum size limit' do
      3.times do
        expect { LitIpsum::Raven.sentences(@rand, repeats: @rand, max_sentence: 5) }.to raise_error(LitIpsum::Error)
      end
    end

    it 'generates litsum from words' do
      expect(LitIpsum::Raven.words(8, repeats: @rand).is_a?(String)).to eq(true)
    end
  end

  context 'without repetition' do
    it 'generates litsum from sentences' do
      3.times do
        expect(LitIpsum::Raven.sentences(@rand).is_a?(String)).to eq(true)
      end
    end

    it 'generates litsum with correct amount of sentences' do
      3.times do
        expect(LitIpsum::Raven.sentences(@rand).scan(LitIpsum::SENTENCE_PATTERN).size).to eq(@rand)
      end
    end

    it 'includes only sentences under or equal to maximum size limit' do
      3.times do
        expect { LitIpsum::Raven.sentences(@rand, max_sentence: 5) }.to raise_error(LitIpsum::Error)
      end
    end

    it 'generates litsum from words', :skip_before do
      expect(LitIpsum::Raven.words(8).is_a?(String)).to eq(true)
    end
  end
end
