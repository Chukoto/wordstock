FactoryBot.define do
  factory :profile do
    text {Faker::Base.regexify("[aあ]{32}")}
    user
  end
end