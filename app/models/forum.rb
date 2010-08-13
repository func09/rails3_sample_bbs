class Forum
  include Mongoid::Document
  include Mongoid::Timestamps

  # Field:
  field :title, :type => String

  # Reference:
  referenced_in :board
  references_many :messages, :dependent => :delete

  # Validation:
  validates_presence_of :title
end
