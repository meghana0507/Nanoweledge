class ReadUserTutorial < ActiveRecord::Base
  #ReadUserTutorial(id: integer, tutorial_id: integer, user_id: integer, created_at: datetime, updated_at: datetime) 
    validates :tutorial_id, presence: true
    validates :user_id, presence: true
    belongs_to :user
    belongs_to :tutorial
end
