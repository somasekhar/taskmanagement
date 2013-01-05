class Task < ActiveRecord::Base
  belongs_to :user
  attr_accessible :content, :title ,:user_id , :check
  validates_presence_of  :title, :content

end
