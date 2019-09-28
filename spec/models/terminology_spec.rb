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

      context 'and the word starts with a vowel' do
        it 'returns the word followed by "ay"' do
          expect(terminology.translate("assessment")).to eq("assessmentay")
        end
      end

      context 'and the word has no vowels' do
        it 'returns the last letter followed by the rest of the word and "ay"' do
          expect(terminology.translate("rhythm")).to eq("mrhythay")
        end
      end
    end
    context 'when passed multiple words' do
      it 'translates them' do
        expect(terminology.translate("risk assessment")).to eq("iskray assessmentay")
      end
    end
    context 'when passed capitalised words' do
      it 'removes capitals and translates them' do
        expect(terminology.translate("Risk Assessment")).to eq("iskray assessmentay")
      end
    end
    context 'when passed phrases with punctuation' do
      it 'removes the punctuation and translates the phrase' do
        expect(terminology.translate("handhq's risk assessment(?), okay!")).to eq("andhqshay iskray assessmentay okayay")
      end
    end
    context 'when passed phrases with punctuation' do
      it 'removes the punctuation and translates the phrase' do
        expect(terminology.translate("handhq's risk assessment(?), okay!")).to eq("andhqshay iskray assessmentay okayay")
      end
    end
    context 'when passed phrases with whitespace' do
      it 'removes the extra white space and translates the phrase' do
        expect(terminology.translate("    risk     assessment    ")).to eq("iskray assessmentay")
      end
    end
  end
end
