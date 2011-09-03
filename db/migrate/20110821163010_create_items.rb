class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :howmany
      t.integer :price
      t.boolean :enabled

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
