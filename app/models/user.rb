# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter]
  include DeviseTokenAuth::Concerns::User
  after_create do
    if email.empty?
      self.email = "#{uid}-#{provider}@example.com"
      save!
    end
  end
end
