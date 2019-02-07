require 'rails_helper'

RSpec.describe Tile, type: :model do

	describe "Associations" do
  	it { should belong_to(:map) }
  	it { should belong_to(:island) }
  end
  
  describe "Validations" do
	  it { should validate_presence_of(:coordinate_x) }
	  it { should validate_presence_of(:coordinate_y) }
	  it { should validate_presence_of(:role) }
	end

	describe "class methods" do
		it 'maps role name to number' do
			expect(Tile.map_role('land')).to eq(1)
			expect(Tile.map_role('water')).to eq(2)
		end
	end
end
