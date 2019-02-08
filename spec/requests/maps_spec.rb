require 'spec_helper'

RSpec.describe 'Maps API' do
  # Test suite for POST /maps
  describe 'POST /api/maps' do
    let(:valid_attributes) do
      { }
    end

    context 'when request attributes are valid' do
      before { post "/api/maps", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end

      it 'changes maps count by 1' do
         expect { post("/api/maps") }.to change { Map.count }.by(1)
      end
    end
  end

  describe 'GET /api/maps/:id' do
    before :each do 
      build_initial_data
      Islands::DetectorService.new(map: @map).call
    end

    before { get "/api/maps/#{@map.id}" }

    it 'returns status code 201' do
      expect(response).to have_http_status(200)
    end

    it 'returns map in ascii code' do
      ascii =  "---x--\n--xxx-\n----x-\n-x----\nxx--x-"

      expect(response.body).to eq ascii
    end
  end
end
