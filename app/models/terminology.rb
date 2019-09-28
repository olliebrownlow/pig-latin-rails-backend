class Terminology < ApplicationRecord

  VOWELS = ["a", "e", "i", "o", "u"]

  def translate(terminology)
    first_vowel_index = terminology.index(/[aeiou]/)
    leading_consonants = terminology[0...first_vowel_index]
    following_letters = terminology[(first_vowel_index)..(terminology.length - 1)]

    following_letters.insert(-1, leading_consonants + "ay")
  end
end
