class Status < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user
  belongs_to :model

  validates :content, presence: true
  validates :user_id, presence: true,
  #for some reason, length: {minimum: 4 } doesn't work, 
  #only this old school way, despite the vs of rails I'm running
             :length => { :minimum => 2 }


end
