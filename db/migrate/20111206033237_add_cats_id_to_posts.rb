class AddCatsIdToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :cats_id, :integer
  end

  def self.down
    remove_column :posts, :cats_id
  end
end
