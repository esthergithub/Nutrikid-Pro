class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @patient = Patient.find(params[:patient_id])
    @comment = @patient.comments.build(comment_params)
    
      if @comment.save
        redirect_to patient_path(@patient)
      else
        format.html { redirect_to patient_path(@patient), notice: 'Post failed...' }
      end
    
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @comment = Comment.find(params[:id])
  end
  def update
    @comment = Comment.find(params[:id])
    @patient = Patient.find(params[:patient_id])
      if @comment.update(params[:comment].permit(:content))
        redirect_to patient_path(@patient)
      end
  end

  def destroy
    @patient = Patient.find(params[:patient_id])
    @comment = Comment.find(params[:id])
    @comment.destroy!
    params[:id] = @patient.id
    respond_to do |format|
      format.html {redirect_to patient_url(id: params[:id])}
      format.js 
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:patient_id,:content,:user_id)
  end
end