class CreateNetworks < ActiveRecord::Migration
  def self.up
    create_table :interweb_networks do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :networks
  end
end
