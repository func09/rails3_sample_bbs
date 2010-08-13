class Forum < ActiveRecord::Base
  belongs_to :board
  has_many :messages
  validates_presence_of :title
end
