class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    @resume = Resume.published.friendly.find(params[:resume_id])
    @comment = @resume.comments.new(comment_params)

    if @comment.save
      redirect_to view_resume_path(@resume), notice: "成功新增留言"
    else
      # flash[:alert] = "error!"
      render "resumes/view"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end
end
