FactoryBot.define do
  factory :sentence do
    english_text {Faker::Base.regexify("[abcdeFGHIJKzZ!?,.""'¥$%&]{10}")}
    japanese_text {Faker::Base.regexify("[あああアアア亜嗚呼。、・？！「」]{10}")}
    content
    user
  end
end