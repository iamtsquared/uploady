class Photo < ActiveRecord::Base
	mount_uploader :filename, PhotoUploader
end
