# frozen_string_literal: true

class User < ApplicationRecord
  # validations
  validates :email, presence: true
  validates :password,
            confirmation: true,
            length: { minimum: 6 }

  # relationships
  has_many :wish_lists
  has_many :comments
  has_many :orders

  has_many :like_wish_lists
  has_many :liked_wish_lists, through: :like_wish_lists, source: :wish_list
  # 我有很多:liked_wish_lists，要藉由through: :like_wish_lists，從來源:wish_list找到願望清單

  # callbacks
  before_create :encrypt_password

  # class methods
  def self.login(email, password)
    hashed_password = Digest::SHA1.hexdigest("xy#{password.reverse}zz")
    find_by(email:, password: hashed_password)
  end

  private

  def encrypt_password
    self.password = Digest::SHA1.hexdigest("xy#{password.reverse}zz")
  end
end
