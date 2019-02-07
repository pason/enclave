require 'rails_helper'

RSpec.describe 'Maps API' do
  # Initialize the test data
  let!(:map) { create(:map) }

  # Test suite for POST /maps
  describe 'POST /maps' do
    let(:valid_attributes) do
      { }
    end

    context 'when request attributes are valid' do
      before { post "/maps", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'changes maps count by 1' do
         expect { post("/maps") }.to change { Map.count }.by(1)
      end
    end
  end
end
