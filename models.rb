class User < ActiveRecord::Base
    validates :first_name, :last_name, :birthday, :email, :password, presence: true
    validates :email, uniqueness: true
    validates :password, uniqueness: true
    has_many :post
end

class Post <ActiveRecord::Base 
    belongs_to :user 
    validates :body, presence: true
end 
