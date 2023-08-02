class Endpoint < ApplicationRecord
  VALID_HTTP_VERBS = ["GET", "HEAD", "POST", "PUT", "PATCH", "DELETE", "CONNECT", "OPTIONS", "TRACE"]

  validates_uniqueness_of :path, :scope => [:verb]

  validates_presence_of :verb, :path, :response
  validates :verb, inclusion: { in: VALID_HTTP_VERBS}

  validate :valid_code_present_in_response

  def valid_code_present_in_response
    if response.present?
      if response["code"].blank?
        errors.add(:response, "code can't be blank")
      elsif (100..599).to_a.exclude?(response["code"])
        errors.add(:response, "code is not valid HTTP response code")
      end
    end
  end
end
