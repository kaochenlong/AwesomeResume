class ResumesController < ApplicationController
  before_action :find_resume, only: [:show]
  before_action :find_my_resume, only: [:edit, :update, :destroy]
  before_action :authenticate_user, except: [:index, :show]

  def index
    flash[:notice] = "123"
    @resumes = Resume.published
  end

  def my
    @resumes = current_user.resumes
  end

  def show
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = current_user.resumes.new(resume_params)

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
      if user_signed_in?
        @resume = current_user.resumes.find(params[:id])
      else
        @resume = Resume.published.find(params[:id])
      end
    end

    def find_my_resume
      @resume = current_user.resumes.find(params[:id])
    end
end
