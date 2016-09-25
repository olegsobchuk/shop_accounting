FactoryGirl.define do
  factory :shop do
    name { Faker::Name.name }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
  end
end
