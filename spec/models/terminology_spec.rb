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
    end
  end
end
