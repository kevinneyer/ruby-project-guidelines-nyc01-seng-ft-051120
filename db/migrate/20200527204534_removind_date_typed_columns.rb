class RemovindDateTypedColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :sessions, :start_time, :datetime
    remove_column :sessions, :end_time, :datetime

    remove_column :study_groups, :end_time, :datetime
    remove_column :study_groups, :start_time, :datetime

  end
end
