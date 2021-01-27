FactoryBot.define do
  factory :description do
    english_text {Faker::Base.regexify("[abcdeFGHIJKzZ!?,.""'¥$%&]{10}")}
    content
    user
  end
end