class Task < ApplicationRecord

  belongs_to :project
  belongs_to :user
  has_many :comments

  enum status: { 'incomplete': 0, 'in progress': 1, 'complete': 2}

end
