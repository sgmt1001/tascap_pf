class Project < ApplicationRecord

 belongs_to :organization
 has_many :tasks
 has_many :members
 has_many :users, through: :members

end
