class CreateStudyGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :study_groups do |t|
      t.string :location
      t.datetime :start_time
      t.datetime :end_time
      t.string :subject
      t.string :remarks
    end
  end
end
