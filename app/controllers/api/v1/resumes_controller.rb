# frozen_string_literal: true

module Api
  module V1
    class ResumesController < Api::V1::BaseController
      def like
        resume = Resume.published.friendly.find(params[:id])
        message = 'no action'

        unless current_user.favorite_resumes.exists?(resume.id)
          current_user.favorite_resumes << resume
          message = 'added'
        end

        render json: { message: }
      end

      def unlike
        resume = Resume.published.friendly.find(params[:id])
        message = 'no action'

        if current_user.favorite_resumes.exists?(resume.id)
          current_user.favorite_resumes.destroy(resume)
          message = 'removed'
        end

        render json: { message: }
      end
    end
  end
end
