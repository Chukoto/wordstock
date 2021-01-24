FactoryBot.define do
  factory :diary do
    title {Faker::Base.regexify("[a]{32}")}
    text {Faker::Base.regexify("[a]{32}")}
    user
  end
end