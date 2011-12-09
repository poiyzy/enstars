class RenameApplicantToApplicants < ActiveRecord::Migration
  def self.up
    rename_table :applicant, :applicants
  end

  def self.down
    rename_table :applicants, :applicant
  end
end
