# frozen_string_literal: true

module Enigma
  module Encoder
    def self.encode_password(password)
      Digest::SHA1.hexdigest(salted_string(password))
    end

    def self.salted_string(str)
      stuffing_chars = %w[x y j a k z]

      part_a = str.chars[0..5].map.with_index do |v, i|
        v + stuffing_chars[i]
      end.join

      part_b = str.chars[6..].join

      "z#{part_a}#{part_b}y"
    end
  end
end
