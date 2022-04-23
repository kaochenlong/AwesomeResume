# frozen_string_literal: true

module ApplicationHelper
  def file_icon(filename)
    filetype = filename.to_s.split(".").last
  end
end
