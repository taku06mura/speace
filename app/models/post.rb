class Post < ApplicationRecord
  belongs_to :user
  validates :text, :title, presence: true, unless: :image?

  mount_uploader :image, ImageUploader
end
