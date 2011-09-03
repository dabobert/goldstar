class CreateSocialMediaAccounts < ActiveRecord::Migration
  def self.up
    create_table :social_media_accounts do |t|
      t.string :username
      t.integer :network_id
      t.integer :profile_id

      t.timestamps
    end
  end

  def self.down
    drop_table :social_media_accounts
  end
end
