# frozen_string_literal: true

class Resume < ApplicationRecord
  extend FriendlyId
  friendly_id :random_slug, use: :slugged

  has_one_attached :mugshot
  has_many_attached :attachments

  # validations
  validates :title, presence: true
  validates :content, presence: true

  # scope
  scope :published, -> { where(status: 'published') }
  scope :draft, -> { where(status: 'draft') }

  # callbacks
  before_create :set_as_default

  # relationships
  belongs_to :user

  def self.all_status
    [
      %w[草稿 draft],
      %w[發佈 published]
    ]
  end

  private

  def random_slug
    [*'a'..'z', *'0'..'9', '-', '_'].sample(10).join
  end

  def set_as_default
    self.pinned = true if user.resumes.count.zero?
  end
end
