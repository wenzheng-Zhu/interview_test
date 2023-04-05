FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    studying_id { SecureRandom.uuid }
    phone_no { Faker::PhoneNumber.unique.cell_phone }
  end
end
