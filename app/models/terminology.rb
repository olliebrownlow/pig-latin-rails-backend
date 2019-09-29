class Terminology < ApplicationRecord
  validates_presence_of :english, :pig_latin
  validates_uniqueness_of :english

  def translate(terminology)
    words = terminology.downcase.gsub(/[^a-z0-9\s]/i, '').split(' ')
    words.map { |word|
      translation = translation(word)
    }.join(" ")
  end

  private

  def translation(word)
    first_vowel_index = word.index(/[aeiou]/)

    if first_vowel_index
      translation = transform_words_with_vowels(word, first_vowel_index)
    else
      translation = transform_words_without_vowels(word)
    end
  end

  def transform_words_with_vowels(word, first_vowel_index)
    leading_consonants = word[0...first_vowel_index]
    following_letters = word[(first_vowel_index)..(word.length - 1)]
    following_letters + leading_consonants + "ay"
  end

  def transform_words_without_vowels(word)
    last_letter = word[-1]
    first_letters = word[0..(word.length - 2)]
    last_letter + first_letters + "ay"
  end
end
