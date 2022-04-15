class ResumesController < ApplicationController
  before_action :find_resume, only: [:show, :edit, :update, :destroy]

  def index
    # render html: current_user
    @resumes = Resume.all
  end

  def show
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

  def edit
  end

  def update
    if @resume.update(resume_params)
      redirect_to resumes_path, notice: "更新成功"
    else
      render :edit
    end
  end

  def destroy
    @resume.destroy
    redirect_to resumes_path, notice: "已刪除"
  end

  private
    # Strong Parameters
    def resume_params
      params.require(:resume).permit(:title, :content, :status)
    end

    def find_resume
      @resume = Resume.find(params[:id])
    end

end
