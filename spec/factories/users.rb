FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password
    cnpj Faker::CNPJ.numeric
  end
end
