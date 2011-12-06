class Posts < ActiveRecord::Migration
  def self.up
    create_table :posts do |p|
      p.string :title
      p.text :content
      p.string :video
      p.string :pic
      p.datetime :created_at
    end
  end

  def self.down
    drop_table :posts
  end
end
