class Step < ActiveRecord::Base
  # Step(id: integer, s_no: integer, description: string, tutorial_id: integer, created_at: datetime, updated_at: datetime) 
    validates :s_no, presence: true
    validates :description, presence: true
    #validates :tutorial_id, presence: true
    belongs_to :tutorial
end
