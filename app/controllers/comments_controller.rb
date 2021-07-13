class CommentsController < ApplicationController
  before_action :set_patient, only: [:create, :edit, :update]
  def create
    @comment = @patient.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to patient_path(@patient), notice: 'Couldnt post...' }
      end
    end
  end

  respond_to do |format|      
    format.js do 
      if params[:images]
        params[:images].each { |image|
          @task.task_assets.create(image: image)
        }
      end
      @task_assets = @task.task_assets
      authorize @task_assets, :create?
      render @task_assets
    end
  end

  def edit
    @comment = @patient.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'Editing comment'
      format.js { render :edit }
    end
  end

  def update
      @comment = @patient.comments.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          flash.now[:notice] = 'Comment edited'
          format.js { render :index }
        else
          flash.now[:notice] = 'Failed to edit comment'
          format.js { render :edit_error }
        end
      end
  end
  
  # add to
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'Comment deleted'
      format.js { render :index }
    end
  end
  # So far
  private
  def comment_params
    params.require(:comment).permit(:patient_id, :content)
  end
  def set_patient
    @patient = Patient.find(params[:patient_id])
  end
end