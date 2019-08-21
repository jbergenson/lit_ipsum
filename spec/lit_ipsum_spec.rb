# frozen_string_literal: true

require 'lit_ipsum'

RSpec.describe LitIpsum do
  it 'has a version number' do
    expect(LitIpsum::VERSION).not_to be nil
  end

  it 'can recognize a sentence' do
    expect(LitIpsum::SENTENCE_PATTERN).to match('Hello World!')
  end

  it 'rejects sentences that end in certain phrases' do
    %w[Mr Mrs Ms Dr].each { |str| expect(LitIpsum::SENTENCE_PATTERN).not_to match("#{str}.") }
  end
end
