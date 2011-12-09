class RenameColumnInApplicant < ActiveRecord::Migration
  def self.up
    rename_column :applicants, :apply_at, :created_at
  end

  def self.down
    rename_column :applicants, :created_at, :apply_at
  end
end
