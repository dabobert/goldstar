class MakeNetworks < ActiveRecord::Migration
  def self.up
    ["goldstar","facebook"].each do |name|
      Network.create! :name=>name
    end
  end

  def self.down
    ["goldstar","facebook"].each do |name|
      Network.find(name).destroy
    end
  end
end
