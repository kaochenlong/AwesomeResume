# frozen_string_literal: true

class Order < ApplicationRecord
  include Slugable

  belongs_to :resume
  belongs_to :user
end
