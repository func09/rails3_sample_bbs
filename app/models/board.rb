class Board < ActiveRecord::Base
  has_many :forums
  validates_presence_of :title
end
