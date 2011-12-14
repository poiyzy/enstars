class AddTelToApplicants < ActiveRecord::Migration
  def self.up
    add_column :applicants, :tel, :integer
  end

  def self.down
    remove_column :applicants, :tel
  end
end
