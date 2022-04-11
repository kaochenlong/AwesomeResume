class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to resumes_path, notice: "新增成功"
    else
      render :new
    end
  end

  private
    # Strong Parameters
    def resume_params
      params.require(:resume).permit(:title, :content, :status)
    end
end