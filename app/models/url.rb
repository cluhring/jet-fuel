class Url < ActiveRecord::Base
  validates :original_url, presence: true
  validates_format_of :original_url, :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/ix

  def generate_tiny_url
    self.tiny_url = SecureRandom.urlsafe_base64(5)
    self.save
  end

  def display_tiny_url
    ENV["BASE_URL"] + "#{self.tiny_url}"
  end

  # def display_tiny_url
  #   "http://" + "#{self.tiny_url}"
  # end

end
