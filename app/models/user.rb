class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :belongings
  has_many :organizations, through: :belongings

  has_many :members
  has_many :projects, through: :members

  has_many :tasks

  has_many :comments, dependent: :destroy

  has_many :reactions, dependent: :destroy



  attachment :profile_image

end
