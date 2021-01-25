FactoryBot.define do
  factory :contents_history do
    word {Faker::Base.regexify("[a]{10}")}
    user
    content
  end
end