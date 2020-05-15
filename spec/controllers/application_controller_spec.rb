# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  controller do
    def standard_error
      raise StandardError
    end

    def no_method_error
      raise NoMethodError
    end
  end

  describe 'error handling' do
    context 'StandardError' do
      it 'returns an error response and 500 status code' do
        routes.draw { get 'standard_error' => 'anonymous#standard_error' }
        get :standard_error
        expect(response).to have_http_status(500)
        body = JSON.parse(response.body)
        expect(body['error']).to eq('Something went wrong')
      end
    end

    context 'NoMethodError' do
      it 'returns an error response and 500 status code' do
        routes.draw { get 'no_method_error' => 'anonymous#no_method_error' }
        get :no_method_error
        expect(response).to have_http_status(500)
        body = JSON.parse(response.body)
        expect(body['error']).to eq('Something went wrong')
      end
    end
  end
end
