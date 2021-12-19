require 'rails_helper'

RSpec.describe 'http_tests' do
  context 'return content from api' do
    it 'with 200 http status' do
      response = Net::HTTP.get_response(URI('https://place.dog/1000/1000'))
      expect(response.code).to eq('200')
      expect(response.body).not_to be_empty
    end

    it 'with 404 return response about bad request' do
      response = Net::HTTP.get_response(URI('https://place.dog/raz/jeden'))
      expect(response.code).to eq('400')
      response_body = JSON.parse(response.body)
      expect(response_body).to eq('message' => 'Please provide a valid width and height')
    end

    it 'dosent have header set_cookie' do
      response = Net::HTTP.get_response(URI('https://place.dog/1000/1000'))
      expect(response.get_fields('set-cookie')).to be_nil
    end
  end
end
