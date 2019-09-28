require 'rails_helper'

RSpec.describe Terminology, type: :model do
  subject(:terminology) { described_class.new }

  describe '#translate' do
    context 'when passed one word' do
      context 'and the word starts with one consonant' do
        it 'returns the word with the consonant at the end followed by "ay"' do
          expect(terminology.translate("risk")).to eq("iskray")
        end
      end

      context 'and the word starts with a cluster of consonants' do
        it 'returns words with a 2-consonant cluster at the end followed by "ay"' do
          expect(terminology.translate("statement")).to eq("atementstay")
        end

        it 'returns words with a 3-consonant cluster at the end followed by "ay"' do
          expect(terminology.translate("strap")).to eq("apstray")
        end

        it 'returns words with a 7-consonant cluster at the end followed by "ay"' do
          expect(terminology.translate("strychnine")).to eq("inestrychnay")
        end
      end
    end
  end
end
