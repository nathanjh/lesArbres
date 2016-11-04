class Vote < ActiveRecord::Base
  validates :votable_id, uniqueness: { scope: :user_id }

  belongs_to :votable, :polymorphic => true
  belongs_to :user
end
