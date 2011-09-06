class AddOauthToSocialMediaAccount < ActiveRecord::Migration
  def self.up
    add_column :social_media_accounts, :oauth_token, :string
    add_column :social_media_accounts, :oauth_token_secret, :string
  end

  def self.down
    remove_column :social_media_accounts, :oauth_token_secret
    remove_column :social_media_accounts, :oauth_token
  end
end
