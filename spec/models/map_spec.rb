require 'rails_helper'

RSpec.describe Map, type: :model do
  describe "Associations" do
    it { should have_many(:tiles).dependent(:destroy) }
    it { should have_many(:islands).dependent(:destroy) }
  end
  
  describe "Validations" do
    it { should validate_presence_of(:dimension_x_axis) }
    it { should validate_presence_of(:dimension_y_axis) }
  end
end
