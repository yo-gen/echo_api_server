require "test_helper"

class EndpointsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
    @endpoint = create(:valid_get_endpoint)
    get endpoints_url, as: :json, headers: {
      'Accept' => JSONAPI::MEDIA_TYPE,
      'Content-Type' => JSONAPI::MEDIA_TYPE
    }
    assert_response :success
  end

  test "should create endpoint" do
    @endpoint = build(:valid_get_endpoint)
    assert_difference("Endpoint.count") do
      post endpoints_url, params: {data: {type: "endpoints", attributes: { path: @endpoint.path, response: @endpoint.response, verb: @endpoint.verb }}}, as: :json, headers: {
        'Accept' => JSONAPI::MEDIA_TYPE,
        'Content-Type' => JSONAPI::MEDIA_TYPE
      }
    end

    assert_response :created
  end

  test "should show endpoint" do
    @endpoint = create(:valid_get_endpoint)
    get endpoint_url(@endpoint), as: :json, headers: {
      'Accept' => JSONAPI::MEDIA_TYPE,
      'Content-Type' => JSONAPI::MEDIA_TYPE
    }
    assert_response :success
  end

  test "should update endpoint" do
    @endpoint = create(:valid_get_endpoint)
    @new_endpoint = build(:valid_post_endpoint)
    patch endpoint_url(@endpoint), params: {data: {type: "endpoints", id: @endpoint.id, attributes: { path: @new_endpoint.path, response: @new_endpoint.response, verb: @new_endpoint.verb }}}, as: :json, headers: {
      'Accept' => JSONAPI::MEDIA_TYPE,
      'Content-Type' => JSONAPI::MEDIA_TYPE
    }
    assert_response :success
  end

  test "should destroy endpoint" do
    @endpoint = create(:valid_get_endpoint)
    assert_difference("Endpoint.count", -1) do
      delete endpoint_url(@endpoint), as: :json, headers: {
        'Accept' => JSONAPI::MEDIA_TYPE,
        'Content-Type' => JSONAPI::MEDIA_TYPE
      }
    end

    assert_response :no_content
  end

  test "should mock endpoint" do
    @endpoint = create(:valid_get_endpoint)
    get @endpoint.path, as: :json, headers: {
      'Accept' => JSONAPI::MEDIA_TYPE,
      'Content-Type' => JSONAPI::MEDIA_TYPE
    }
    assert_response :success
  end

  test "should fail for not created mock endpoint" do
    @endpoint = create(:valid_get_endpoint)
    get "/xcnmdfn", as: :json, headers: {
      'Accept' => JSONAPI::MEDIA_TYPE,
      'Content-Type' => JSONAPI::MEDIA_TYPE
    }
    assert_response :not_found
  end
end
