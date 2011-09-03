class AddMiscToStar < ActiveRecord::Migration
  def self.up
    add_column :stars, :misc, :string
  end

  def self.down
    remove_column :stars, :misc
  end
end
