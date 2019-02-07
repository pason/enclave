FactoryBot.define do
  factory :map do
    dimension_x_axis { Faker::Number.number(2) }
    dimension_y_axis { Faker::Number.number(2) }
  end
end