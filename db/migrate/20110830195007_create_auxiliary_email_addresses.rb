class CreateAuxiliaryEmailAddresses < ActiveRecord::Migration
  def self.up
    create_table :auxiliary_email_addresses do |t|
      t.integer :user_id
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :auxiliary_email_addresses
  end
end
