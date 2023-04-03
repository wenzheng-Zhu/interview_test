FactoryBot.define do
  factory :teacher do
    name { Faker::Name.unique.name }
    phone_no { Faker::PhoneNumber.unique.cell_phone }
  end
end
