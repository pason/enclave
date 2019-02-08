# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Islands API', type: :request do
  # Test suite for POST /islands
  describe 'GET /api/islands' do
    before(:all) do
      build_initial_data
      Islands::DetectorService.new(map: @map).call
    end

    context 'when request attributes are valid' do
      before { get '/api/islands' }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns list of islands' do
        valid_response =  [{ 'id' => 1,
                             'map_id' => 1,
                             'tiles' => [{ 'x' => 5, 'y' => 3 },
                                         { 'x' => 3, 'y' => 4 },
                                         { 'x' => 4, 'y' => 4 },
                                         { 'x' => 5, 'y' => 4 },
                                         { 'x' => 4, 'y' => 5 }] },
                           { 'id' => 2,
                             'map_id' => 1,
                             'tiles' => [{ 'x' => 1, 'y' => 1 },
                                         { 'x' => 2, 'y' => 1 },
                                         { 'x' => 2, 'y' => 2 }] },
                           { 'id' => 3,
                             'map_id' => 1,
                             'tiles' => [{ 'x' => 5, 'y' => 1 }] }]

        expect(json).to eq(valid_response)
      end
    end
  end

  describe 'GET /api/islands/:id' do
    before { get '/api/islands/1' }

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end

    it 'returns islands data' do
      valid_response = { 'id' => 1,
                         'map_id' => 1,
                         'tiles' => [{ 'x' => 5, 'y' => 3 },
                                     { 'x' => 3, 'y' => 4 },
                                     { 'x' => 4, 'y' => 4 },
                                     { 'x' => 5, 'y' => 4 },
                                     { 'x' => 4, 'y' => 5 }] }

      expect(json).to eq(valid_response)
    end
  end
end
