class Photo < ActiveRecord::Base
	mount_uploader :filename, PhotoUploader
	belongs_to :user
end
