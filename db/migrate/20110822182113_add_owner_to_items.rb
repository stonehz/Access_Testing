class AddOwnerToItems < ActiveRecord::Migration
  def self.up
	add_column :items, :owner, :integer
  end

  def self.down
  	remove_column :items, :owner
  end
end
