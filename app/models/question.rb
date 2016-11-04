class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :user
  has_one :best_answer, source: :answergit 
  has_many :comments, :as => :commentable
  has_many :votes, :as => :votable
end
