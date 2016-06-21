FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "foo#{n}@example.com"
    end
    password Faker::Internet.password
    sequence :cnpj do |n|
      "#{n}"
    end
  end
end
