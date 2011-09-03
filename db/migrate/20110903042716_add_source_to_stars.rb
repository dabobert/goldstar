class AddSourceToStars < ActiveRecord::Migration
  def self.up
    add_column :stars, :source_id, :string
    add_column :stars, :source_type, :string, :default=>"goldstar"
  end

  def self.down
    remove_column :stars, :source_type
    remove_column :stars, :source_id
  end
end
