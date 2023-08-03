# Read about fixtures at https://api.rubyonrails.org/classes/ActiveRecord/FixtureSet.html
FactoryBot.define do
  factory :valid_get_endpoint, class: 'Endpoint' do
    verb { 'GET' }
    path { '/greetings' }
    response do
      {
        code: 200,
        headers: { "key": 'secret_api_key' },
        body: { message: 'Hello from echo' }
      }
    end
  end

  factory :valid_patch_endpoint, class: 'Endpoint' do
    verb { 'PATCH' }
    path { '/greetings' }
    response do
      {
        code: 200,
        headers: { "patch_key": 'patch_secret_api_key' },
        body: { message: 'Hello this is patch request from echo' }
      }
    end
  end

  factory :valid_post_endpoint, class: 'Endpoint' do
    verb { 'POST' }
    path { '/greetings' }
    response do
      {
        code: 201,
        headers: { "post_key": 'post_secret_api_key' },
        body: { message: 'Created response from echo' }
      }
    end
  end

  factory :endpoint_without_verb, class: 'Endpoint' do
    path { '/greetings' }
    response do
      {
        code: 200,
        headers: { "key": 'secret_api_key' },
        body: { message: 'Hello from echo' }
      }
    end
  end

  factory :endpoint_without_path, class: 'Endpoint' do
    verb { 'GET' }
    response do
      {
        code: 200,
        headers: { "key": 'secret_api_key' },
        body: { message: 'Hello from echo' }
      }
    end
  end

  factory :endpoint_without_response, class: 'Endpoint' do
    verb { 'GET' }
    path { '/greetings' }
  end

  factory :endpoint_with_invalid_verb, class: 'Endpoint' do
    verb { 'HAVE' }
    path { '/greetings' }
    response do
      {
        code: 200,
        headers: { "key": 'secret_api_key' },
        body: { message: 'Hello from echo' }
      }
    end
  end

  factory :endpoint_with_invalid_response_code, class: 'Endpoint' do
    verb { 'GET' }
    path { '/greetings' }
    response do
      {
        code: 777,
        headers: { "key": 'secret_api_key' },
        body: { message: 'Hello from echo' }
      }
    end
  end

  factory :endpoint_with_path_endpoints, class: 'Endpoint' do
    verb { 'GET' }
    path { '/endpoints/abcd' }
    response do
      {
        code: 200,
        headers: { "key": 'secret_api_key' },
        body: { message: 'Hello from echo' }
      }
    end
  end

  factory :endpoint_with_invalid_path, class: 'Endpoint' do
    verb { 'GET' }
    path { "/aa..##{$$}%%^^&&" }
    response do
      {
        code: 200,
        headers: { "key": 'secret_api_key' },
        body: { message: 'Hello from echo' }
      }
    end
  end
end
