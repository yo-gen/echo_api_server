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
end
