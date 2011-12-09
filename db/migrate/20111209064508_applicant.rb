class Applicant < ActiveRecord::Migration
  def self.up
    create_table :applicants do |a|
      a.string :name
      a.integer :phone
      a.string :email
      a.string :school
      a.string :grate
      a.string :sex
      a.datetime :apply_at
    end
  end

  def self.down
    drop_table :applicants
  end
end
