# frozen_string_literal: true

class User < ApplicationRecord
  validates :postal_code, numericality: { less_than: 10_000_000 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
