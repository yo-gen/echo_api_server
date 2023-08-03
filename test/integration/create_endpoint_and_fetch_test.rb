# frozen_string_literal: true

require 'test_helper'

class CreateEndpointAndFetchTest < ActionDispatch::IntegrationTest
  test 'should create endpoint and fetch' do
    @endpoint = build(:valid_get_endpoint)
    post endpoints_url,
         params: {
           data: {
             type: 'endpoints',
             attributes: { path: @endpoint.path, response: @endpoint.response, verb: @endpoint.verb }
           }
         }, as: :json,
         headers: {
           'Accept' => JSONAPI::MEDIA_TYPE,
           'Content-Type' => JSONAPI::MEDIA_TYPE
         }
    get_response_data = get @endpoint.path, as: :json, headers: {
      'Accept' => JSONAPI::MEDIA_TYPE,
      'Content-Type' => JSONAPI::MEDIA_TYPE
    }
    post_response_data = post @endpoint.path, as: :json, headers: {
      'Accept' => JSONAPI::MEDIA_TYPE,
      'Content-Type' => JSONAPI::MEDIA_TYPE
    }
    assert_equal 200, get_response_data
    assert_equal 404, post_response_data
  end
end
