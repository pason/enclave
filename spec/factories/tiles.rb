FactoryBot.define do
  factory :tile do
    coordinate_x { Faker::Number.number(2) }
    coordinate_y { Faker::Number.number(2) }
    role { 1 }
  end
end