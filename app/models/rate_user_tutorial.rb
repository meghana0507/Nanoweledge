class RateUserTutorial < ActiveRecord::Base
  
  # RateUserTutorial(id: integer, tutorial_id: integer, user_id: integer, score: integer, created_at: datetime, updated_at: datetime) 
    validates :score, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 5 }  
    validates :tutorial_id, presence: true
    validates :user_id, presence: true
    belongs_to :user
    belongs_to :tutorial
end
