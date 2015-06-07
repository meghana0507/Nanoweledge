class Topic < ActiveRecord::Base
  #Topic(id: integer, name: string, category_id: integer, created_at: datetime, updated_at: datetime) 
    validates :name, presence: true
    validates :category_id, presence: true
    belongs_to :category
    has_many :tutorials
    has_many :requests
end
