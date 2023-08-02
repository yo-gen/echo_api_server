class EndpointResource < JSONAPI::Resource
  attributes :verb, :path, :response
end
