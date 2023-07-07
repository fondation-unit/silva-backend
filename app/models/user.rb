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

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE)
#  confirmation_sent_at   :datetime
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  failed_attempts        :integer          default(0), not null
#  firstname              :string(255)      default(""), not null
#  jti                    :string(255)      not null
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string(255)
#  lastname               :string(255)      default(""), not null
#  locked_at              :datetime
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  sign_in_count          :integer          default(0), not null
#  unconfirmed_email      :string(255)
#  unlock_token           :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_jti                   (jti) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
