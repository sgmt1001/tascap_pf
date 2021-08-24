class Comment < ApplicationRecord

  belongs_to :task
  belongs_to :user
  has_many :reactions, dependent: :destroy

  def reactioned_by?(user)
    reactions.where(user_id: user.id).exists?
  end

end
