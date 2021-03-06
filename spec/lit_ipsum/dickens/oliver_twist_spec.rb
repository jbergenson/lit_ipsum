# frozen_string_literal: true

require 'lit_ipsum/dickens/oliver_twist'

RSpec.describe LitIpsum::Dickens::OliverTwist do
  before(:each) do |spec|
    @rand = rand(3..24) unless spec.metadata[:skip_before]
  end

  context 'with repetition' do
    it 'generates litsum from sentences' do
      3.times do
        expect(LitIpsum::OliverTwist.sentences(@rand, repeats: @rand).is_a?(String)).to eq(true)
      end
    end

    it 'generates litsum with correct amount of sentences' do
      3.times do
        expect(LitIpsum::OliverTwist.sentences(@rand, repeats: @rand).scan(LitIpsum::SENTENCE_PATTERN).size).to eq(@rand * @rand)
      end
    end

    it 'includes only sentences under or equal to maximum size limit' do
      3.times do
        expect(LitIpsum::OliverTwist.sentences(@rand, repeats: @rand, max_sentence: 5).scan(LitIpsum::SENTENCE_PATTERN).map(&:size).max).to be <= 5
      end
    end

    it 'generates litsum from words' do
      expect(LitIpsum::OliverTwist.words(8, repeats: @rand).is_a?(String)).to eq(true)
    end
  end

  context 'without repetition' do
    it 'generates litsum from sentences' do
      3.times do
        expect(LitIpsum::OliverTwist.sentences(@rand).is_a?(String)).to eq(true)
      end
    end

    it 'generates litsum with correct amount of sentences' do
      3.times do
        expect(LitIpsum::OliverTwist.sentences(@rand).scan(LitIpsum::SENTENCE_PATTERN).size).to eq(@rand)
      end
    end

    it 'includes only sentences under or equal to maximum size limit' do
      3.times do
        expect(LitIpsum::OliverTwist.sentences(@rand, max_sentence: 5).scan(LitIpsum::SENTENCE_PATTERN).map(&:size).max).to be <= 5
      end
    end

    it 'generates litsum from words', :skip_before do
      expect(LitIpsum::OliverTwist.words(8).is_a?(String)).to eq(true)
    end
  end
end
