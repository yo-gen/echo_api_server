class EndpointsController < ApplicationController
  def mock
    endpoint = Endpoint.where(verb: request.method, path: request.path).first
    if endpoint.present?
      resp = endpoint.response
      resp["headers"].map{|key, value| response.set_header(key, value)}

      render json: resp["body"], status: resp["code"]
    else
      render json: {
        "errors": [
            {
                "code": "not_found",
                "detail": "Requested page #{request.method} '#{request.path}' does not exist"
            }
        ]
      }, status: :not_found
    end
  end
end
