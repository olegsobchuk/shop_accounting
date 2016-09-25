FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name  }
    placing { Faker::Address.street_address }
    phone_first { "+#{Faker::Number.number(10)}" }
    phone_second { "+#{Faker::Number.number(10)}" }
  end

  factory :owner, parent: :user do
    type 'Owner'
  end
end
