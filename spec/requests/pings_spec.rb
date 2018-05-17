require 'rails_helper'

RSpec.describe 'Pings API', type: :request do
  # initialize test data 
  # let!(:pings) { create_list(:ping, 10) }
  # let(:todo_id) { pings.first.id }

  # # Test suite for GET /pings
  # describe 'GET /pings' do
  #   # make HTTP get request before each example
  #   before { get '/pings' }

  #   it 'returns pings' do
  #     # Note `json` is a custom helper to parse JSON responses
  #     expect(json).not_to be_empty
  #     expect(json.size).to eq(10)
  #   end

  #   it 'returns status code 200' do
  #     expect(response).to have_http_status(200)
  #   end
  # end

  # Test suite for GET /:device_id/:date
  # describe 'GET /:device_id/:date' do
  #   before { get "/3d0cce9c-b1e0-e8d7-e598-3c4510422cdd/#{todo_id}" }

  #   context 'when the record exists' do
  #     it 'returns the ping' do
  #       expect(json).not_to be_empty
  #       expect(json['id']).to eq(todo_id)
  #     end

  #     it 'returns status code 200' do
  #       expect(response).to have_http_status(200)
  #     end
  #   end

  #   context 'when the record does not exist' do
  #     let(:todo_id) { 100 }

  #     it 'returns status code 404' do
  #       expect(response).to have_http_status(404)
  #     end

  #     it 'returns a not found message' do
  #       expect(response.body).to match(/Couldn't find Ping/)
  #     end
  #   end
  # end

  # Test suite for POST /pings
  describe 'POST /:device_id/:epoch_time' do
    # valid payload
    # let(:valid_attributes) {
    #   { 
    #     device_id: '3d0cce9c-b1e0-e8d7-e598-3c4510422cdd', 
    #     datetimestamp: '1525151590'
    #   } 
    # }

    context 'when the request is valid' do
      # before { post '/:device_id/:epoch_time', params: valid_attributes }
      before { post '/3d0cce9c-b1e0-e8d7-e598-3c4510422cdd/1525151590' }

      it 'creates a ping' do
        expect(json['identifier']).to eq('3d0cce9c-b1e0-e8d7-e598-3c4510422cdd')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    # context 'when the request is invalid' do
    #   before { post '/3d0cce9c-b1e0-e8d7-e598-3c4510422cdd/1525151590' }

    #   it 'returns status code 422' do
    #     expect(response).to have_http_status(422)
    #   end

    #   it 'returns a validation failure message' do
    #     expect(response.body)
    #       .to match(/Validation failed: Created by can't be blank/)
    #   end
    # end
  end
end