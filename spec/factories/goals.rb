FactoryGirl.define do
  factory :goal do
    title { Faker::Book.title}
    body { Faker::Lorem.paragraph(2)}
    trait :finished do
      finished true
    end
    trait :blobby do
      blobby true
    end
    user_id 1
  end
end
