class Keyword < ActiveRecord::Base
  #Keyword(id: integer, name: string, created_at: datetime, updated_at: datetime) 
    validates :name, presence: true
    has_many :tutorials, :through => :keyword_tutorials
    has_many :keyword_tutorials
end
