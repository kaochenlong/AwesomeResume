class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 6}

  before_save :encrypt_password

  private
    def encrypt_password
      self.password = encode_password(self.password)
    end

    def encode_password(pw)
      Digest::SHA1.hexdigest(salted_string(pw))
    end

    def salted_string(str)
      stuffing_chars = ["x", "y", "j", "a", "k", "z"]

      part_a = str.chars[0..5].map.with_index { |v, i|
        v + stuffing_chars[i]
      }.join

      part_b = str.chars[6..].join

      "z#{part_a}#{part_b}y"
    end
end
