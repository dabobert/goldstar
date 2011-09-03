class AddNetworksToStars < ActiveRecord::Migration
  def self.up
    add_column :stars, :sender_network_id, :integer, :default=>1
    add_column :stars, :receiver_network_id, :integer, :default=>1
  end

  def self.down
    remove_column :stars, :sender_network_id
    remove_column :stars, :receiver_network_id
  end
end
