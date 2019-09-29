FactoryBot.define do
  factory :random_terminology, class: Terminology do
    english { Faker::Construction.trade }
    pig_latin { Faker::Construction.trade }
  end
end
