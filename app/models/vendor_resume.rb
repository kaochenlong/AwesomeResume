# frozen_string_literal: true

class VendorResume < ApplicationRecord
  belongs_to :user
  belongs_to :resume
end
