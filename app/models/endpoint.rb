class Endpoint < ApplicationRecord
  validates_uniqueness_of :path, :scope => [:verb]
  validates_presence_of :verb, :path, :response
end
