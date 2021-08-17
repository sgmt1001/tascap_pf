class Task < ApplicationRecord

  belongs_to :project, optional: true
  belongs_to :user, optional: true
  has_many :comments

  enum status: { 'incomplete': 0, 'in progress': 1, 'complete': 2}

end
