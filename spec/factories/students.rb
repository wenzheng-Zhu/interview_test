FactoryBot.define do
  factory :student do
    name { "MyString" }
    studying_id { SecureRandom.uuid }
    phone_no { Faker::PhoneNumber.unique.cell_phone }
  end
end
