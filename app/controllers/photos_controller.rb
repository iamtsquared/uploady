class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    #current_user given by devise
    #current_user returns an instance of the User
    #index will only present the photos of the signed in user
    @photos = current_user.photos
  end

  def new
  	@photo = Photo.new
  end

  def create
  	# @photo = Photo.new(photo_params)
   #  @photo.user = current_user

   #shorter method, same as above two lines that are commented out
   @photo = current_user.photos.build(photo_params)

  	if @photo.save
  		redirect_to photos_path
  	else
  		render :new
  	end
  end

  def edit
    @photo = current_user.photos.find(params[:id])
    #@photo = Photo.find(params[:id])
  end

  def update
    @photo = current_user.photos.find(params[:id])
    #@photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      redirect_to photos_path
    else
      render :edit
    end

  end

  private

  def photo_params
  	params.require(:photo).permit(:filename, :caption)
  end

end
