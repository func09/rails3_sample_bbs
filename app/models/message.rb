class Message
  include Mongoid::Document
  include Mongoid::Timestamps

  # Field:
  field :name, :type => String
  field :body, :type => String
  field :email, :type => String
  field :position, :type => Integer, :default => 1

  # Reference:
  referenced_in :forum, :inverse_of => :messages

  # Validation:
  validates_presence_of :body

  # Callback:
  before_save :forum_float!
  before_create :set_position

  # Class Methods

  # @param [String] filter ex) l50 -100
  
  def self.filterd(filter)
    case filter
    when /^l([0-9]+)$/
      order_by(:position).limit($1.to_i)
    when /^([0-9]+)?-([0-9]+)?$/
      s = $1.to_i
      e = $2.to_i
      order_by(:position).limit(e-s).skip(s)
    else
      order_by(:position)
    end
  end
  
  private

  def set_position
    self.position = self.forum.messages.count + 1
  end

  def forum_float!
    self.forum.save unless self.email == 'sage'
  end
  
end
