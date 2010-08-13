class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.references :forum
      t.integer :position, :null => false, :default => 1
      t.string :name
      t.text :body
      t.string :uid
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
