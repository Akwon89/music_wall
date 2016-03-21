class Track < ActiveRecord::Base

  validates :song_title, presence: true, length: { maximum: 40 }
  validates :author, presence: true, length: { maximum: 40 }
  validate :url_checker, if: :url

  def url_checker
    errors.add(:invalid_url, ": url is invalid") unless url =~ /\A^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$\Z/i || url == ""
  end


end