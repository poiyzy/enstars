class Add5ColumnToApplicants < ActiveRecord::Migration
  def self.up
    add_column :applicants, :pname, :string
    add_column :applicants, :address, :string
    add_column :applicants, :birth, :string
    add_column :applicants, :idcard, :string
  end

  def self.down
    remove_column :applicants, :idcard
    remove_column :applicants, :birth
    remove_column :applicants, :address
    remove_column :applicants, :pname
  end
end