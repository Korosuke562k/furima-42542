FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname  { Faker::Name.initials(number: 2) }
    myoji     { person.first.kanji }
    name      { person.last.kanji }
    myoji_kana { person.first.katakana }
    mei_kana  { person.last.katakana }
    birthday  { Faker::Date.backward }
    email     { Faker::Internet.email }
    password  {'1a' + Faker::Internet.password(min_length: 6)}
  end
end
