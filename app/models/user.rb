# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  include Roleable

  USER_NAME_REGEX = /[^a-zéèàùïöüâêîôû\s-]/i

  before_save :cleanup_username

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  validates :email, uniqueness: true
  validates :firstname, presence: true
  validates :lastname, presence: true

  private

  def cleanup_username
    self.firstname = firstname.gsub(USER_NAME_REGEX, "").to_s.patronize
    self.lastname = lastname.gsub(USER_NAME_REGEX, "").to_s.patronize
  end

end
