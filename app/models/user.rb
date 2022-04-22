# frozen_string_literal: true

class User < ApplicationRecord
  # validations
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 6 }

  # relationships
  has_many :resumes

  # callbacks
  before_create :encrypt_password

  def default_resume
    resumes.last
  end

  def self.login(user_data)
    account = user_data[:account]
    password = user_data[:password]

    return unless account && password

    user = find_by('email = ? OR username = ?', account, account)
    user if user && user.password == Enigma::Encoder.encode_password(password)
  end

  private

  def encrypt_password
    self.password = Enigma::Encoder.encode_password(password)
  end
end
