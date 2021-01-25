FactoryBot.define do
  factory :content do
    part_id {1}
    word {Faker::Base.regexify("[a]{10}")}
    user
  end
end