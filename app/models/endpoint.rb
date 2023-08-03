class Endpoint < ApplicationRecord
  VALID_HTTP_VERBS = %w[GET HEAD POST PUT PATCH DELETE CONNECT OPTIONS TRACE]

  validates_uniqueness_of :path, scope: [:verb]

  validates_presence_of :verb, :path, :response
  validates :verb, inclusion: { in: VALID_HTTP_VERBS }

  validate :path_is_valid

  validate :valid_code_present_in_response

  def path_is_valid
    if path.present? && path.start_with?('/endpoints/')
      errors.add(:path, '/endpoints/ path is reserved for Endpoints API and is not valid')
    elsif !valid_relative_path?(path)
      errors.add(:path, 'path is not a valid URI')
    end
  end

  def valid_code_present_in_response
    return unless response.present?

    if response['code'].blank?
      errors.add(:response, "code can't be blank")
    elsif (100..599).to_a.exclude?(response['code'])
      errors.add(:response, 'code is not valid HTTP response code')
    end
  end

  def valid_relative_path?(path)
    uri = URI.parse(path)
    uri.relative? && !uri.path.empty?
  rescue URI::InvalidURIError
    false
  end
end
