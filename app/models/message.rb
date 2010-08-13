class Message < ActiveRecord::Base
  belongs_to :forum
  validates_presence_of :body

  def before_validation_on_create
    if last_message = self.forum.messages.last
      self.position = last_message.position + 1
    end
  end

  def before_save
    unless self.email == 'sage'
      self.forum.touch
    end
  end
  
  def self.filterd(filter)
    case filter
    when /^l([0-9]+)$/
      order(:position).limit($1)
    when /^([0-9]+)?-([0-9]+)?$/
      s = $1.to_i
      e = $2.to_i
      order(:position).limit(e-s).offset(s)
    else
      order(:position)
    end
  end
  
end
