class CommentsController < ApplicationController
  #only logged in users can comment
  before_action :authenticate_user!


  def index
	@photo = Photo.find(params[:photo_id])  
  	@comments = Comment.where(photo_id: params[:photo_id])

  end


  def new
  	#nested route of photo/photo_id/comment/id
  	@photo = Photo.find(params[:photo_id])
  	@comment = Comment.new
  end

  def create
  	@photo = Photo.find(params[:photo_id])
  	@comment = Comment.new(comment_params)
  	@comment.user = current_user
  	@comment.photo = @photo

  	if @comment.save
  		redirect_to photos_path, notice: "Your reply has been saved"
  	end

  end

  #creates safe sanitized params
  def comment_params
  	params.require(:comment).permit(:body)
  end

end
