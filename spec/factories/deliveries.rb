FactoryGirl.define do
  factory :delivery do
    uid { Faker::Number.number(10) }
    departure { Faker::Date.between(2.months.ago, 1.month.ago) }

    after(:build) { |delivery| delivery.arrival = delivery.departure + 10.days }
  end
end
