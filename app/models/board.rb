class Board
  include Mongoid::Document
  include Mongoid::Timestamps

  # Field:
  field :title, :type => String

  # Reference:
  references_many :forums

  # Validation:
  validates_presence_of :title
  
end
