class CreateStars < ActiveRecord::Migration
  def self.up
    create_table :stars do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :stars
  end
end
