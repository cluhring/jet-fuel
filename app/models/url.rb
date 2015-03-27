class Url < ActiveRecord::Base
  validates :original_url, presence: true
  validates_format_of :original_url, :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix
end
