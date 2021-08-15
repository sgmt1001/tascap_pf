class Organization < ApplicationRecord

    has_many :belongings
    has_many :users, through: :belongings
    has_many :projects, dependent: :destroy
    has_many :invitations

end
