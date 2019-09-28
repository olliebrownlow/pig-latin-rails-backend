class Terminology < ApplicationRecord

  def translate(terminology)
    first_vowel_index = terminology.index(/[aeiou]/)

    if first_vowel_index
      transform_words_with_vowels(terminology, first_vowel_index)
    else
      transform_words_without_vowels(terminology)
    end
  end

  private

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
