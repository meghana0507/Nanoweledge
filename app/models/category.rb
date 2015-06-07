class Category < ActiveRecord::Base
  #Category(id: integer, name: string, created_at: datetime, updated_at: datetime) 
    validates :name, presence: true
    has_many :topics
    has_many :tutorials, :through=>:topics
end
