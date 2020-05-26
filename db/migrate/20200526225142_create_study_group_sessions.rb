class CreateStudyGroupSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :study_group_sessions do |t|
      t.integer :student_id
      t.integer :study_group_id
    end
  end
end
