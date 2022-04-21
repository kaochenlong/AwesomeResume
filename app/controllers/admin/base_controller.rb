class Admin::BaseController < ApplicationController
  before_action :check_permission
# - 在 base controller 檢查權限
# - 把自己調整成 admin
# - 檢視 /admin/vendors 頁面

  private
    def check_permission
      available_roles = ["admin", "staff"]
      redirect_to root_path unless (user_signed_in? && current_user.role.in?(available_roles))
    end
end
