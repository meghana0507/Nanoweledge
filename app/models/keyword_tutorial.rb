class KeywordTutorial < ActiveRecord::Base
  
  #KeywordTutorial(id: integer, tutorial_id: integer, keyword_id: integer, created_at: datetime, updated_at: datetime) 
    validates :keyword_id, presence: true
    validates :tutorial_id, presence: true
    belongs_to :keyword
    belongs_to :tutorial
end
