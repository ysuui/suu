class Post < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :comments, dependent: :destroy
    mount_uploader :video, VideoUploader
    belongs_to :user
end
