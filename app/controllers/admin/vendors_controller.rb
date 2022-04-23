# frozen_string_literal: true

module Admin
  class VendorsController < ::BaseController
    def index
      authorize :vendor
      @vendors = User.vendors
    end

    def new
      authorize :vendor
      @vendor = User.new
    end

    def create
      authorize :vendor
      @vendor = User.new(vendor_params)

      if @vendor.save
        redirect_to admin_vendors_path, notice: '已成功新增'
      else
        render :new
      end
    end

    def edit
      authorize :vendor
    end

    def update
      authorize :vendor
    end

    def destroy
      authorize :vendor
    end

    private
    def vendor_params
      params.require(:user).permit(:email, :name, :username, :password, :password_confirmation).merge(role: 'vendor')
    end
  end
end
