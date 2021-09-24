class Task < ApplicationRecord

  belongs_to :project
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  enum status: { 'incomplete': 0, 'in progress': 1, 'complete': 2}

  validates :name, presence: true
  validates :man_hour, presence: true, numericality: { only_integer: true }


end
