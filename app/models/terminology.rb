class Terminology < ApplicationRecord

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

  def transform_words_with_vowels(terminology, first_vowel_index)
    leading_consonants = terminology[0...first_vowel_index]
    following_letters = terminology[(first_vowel_index)..(terminology.length - 1)]
    following_letters + leading_consonants + "ay"
  end

  def transform_words_without_vowels(terminology)
    last_letter = terminology[-1]
    first_letters = terminology[0..(terminology.length - 2)]
    last_letter + first_letters + "ay"
  end
end
