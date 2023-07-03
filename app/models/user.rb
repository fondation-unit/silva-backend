# frozen_string_literal: true

class User < ApplicationRecord
  require "string"
  include Devise::JWT::RevocationStrategies::JTIMatcher
  include Roleable

  USER_NAME_REGEX = /[^a-zéèàùïöüâêîôû\s-]/i

  before_validation :cleanup_username

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :firstname, presence: true, length: { in: 2..30 }
  validates :lastname, presence: true, length: { in: 2..30 }

  private

  def cleanup_username
    self.firstname = firstname.gsub(USER_NAME_REGEX, "").to_s.patronize
    self.lastname = lastname.gsub(USER_NAME_REGEX, "").to_s.patronize
  end

end
