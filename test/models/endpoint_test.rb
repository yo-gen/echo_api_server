require "test_helper"

class EndpointTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save endpoint without verb" do
    endpoint = build(:endpoint_without_verb)
    assert_not endpoint.save, "Saved the endpoint without a verb"
  end

  test "should not save endpoint without path" do
    endpoint = build(:endpoint_without_path)
    assert_not endpoint.save, "Saved the endpoint without a path"
  end

  test "should not save endpoint without response" do
    endpoint = build(:endpoint_without_response)
    assert_not endpoint.save, "Saved the endpoint without a response"
  end

  test "should not save endpoint with invalid verb" do
    endpoint = build(:endpoint_with_invalid_verb)
    assert_not endpoint.save, "Saved the endpoint with a invalid verb"
  end

  test "should not save endpoint with invalid response code" do
    endpoint = build(:endpoint_with_invalid_response_code)
    assert_not endpoint.save, "Saved the endpoint with a invalid response code"
  end

  test "should not save endpoint with /endpoints/ in start of path" do
    endpoint = build(:endpoint_with_path_endpoints)
    assert_not endpoint.save, "Saved the endpoint starting with a /endpoints/ path"
  end

  test "should not save endpoint with invalid URI in path" do
    endpoint = build(:endpoint_with_invalid_path)
    assert_not endpoint.save, "Saved the endpoint with an invalid URI in path"
  end

  test "should save valid endpoint" do
    endpoint = build(:valid_get_endpoint)
    assert endpoint.save, "Saved the valid endpoint successfully"
  end
end
