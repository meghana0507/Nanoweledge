class PasswordConfirmationValidator < ActiveModel::Validator
  def validate(record)
    unless record.password==record.password_confirmation
      record.errors[:password_confirmation] << 'needs to be same as password.'
    end
  end
end

class User < ActiveRecord::Base
  #User(id: integer, pw: string, user_name: string, email: string, created_at: datetime, updated_at: datetime) 
    attr_accessor :password_confirmation
    validates_with PasswordConfirmationValidator
    validates :user_name, presence: true
    validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :password, presence: true
    
    has_many :read_user_tutorials
    has_many :rate_user_tutorials
    has_many :read_tutorials, :through => :read_user_tutorials, source: "tutorial"
    has_many :rate_tutorials, :through => :rate_user_tutorials, source: "tutorial"
    has_many :tutorials
    has_many :requests
end
