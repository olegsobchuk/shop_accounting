FactoryGirl.define do
  factory :user do
    password { Faker::Internet.password(10, 20) }
    phone_first { "+#{Faker::Number.number(10)}" }
    phone_second { "+#{Faker::Number.number(10)}" }

    after(:build) { |user| user.password_confirmation = user.password }
  end

  factory :owner, parent: :user do
    type 'Owner'
  end

  factory :admin, parent: :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name  }
    type 'Admin'
    phone_first { Faker::PhoneNumber.cell_phone }
  end

  factory :assistant, parent: :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name  }
    type 'Assistant'
    phone_first { Faker::PhoneNumber.cell_phone }
  end
end
