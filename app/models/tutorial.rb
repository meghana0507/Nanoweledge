class Tutorial < ActiveRecord::Base
  
  # Tutorial(id: integer, title: string, tutorial_level: integer, user_id: integer, topic_id: integer, created_at: datetime, updated_at: datetime) 
    validates :user_id, presence: true
    validates :topic_id, presence: true
    validates :title, presence: true
    validates :tutorial_level, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 5 }  
    belongs_to :user
    has_many :read_user_tutorials
    has_many :read_users, :through => :read_user_tutorials, source: "user"
    has_many :rate_user_tutorials
    has_many :rate_users, :through => :rate_user_tutorials, source: "user"
    has_many :keyword_tutorials
    has_many :keywords, :through => :keyword_tutorials
    has_many :steps
    belongs_to :topic
    accepts_nested_attributes_for :steps, :reject_if => :all_blank, :allow_destroy => true
    accepts_nested_attributes_for :keywords, :reject_if => :all_blank, :allow_destroy => true
    # searchable do
    #   text :title
    #   text :steps do
    #     steps.map{ |step| step.description}
    #   end
    # end
    
    
end
