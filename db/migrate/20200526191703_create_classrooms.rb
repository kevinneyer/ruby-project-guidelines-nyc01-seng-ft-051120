class CreateClassrooms < ActiveRecord::Migration[5.0]
  def change
    create_table :classrooms do |t|
      t.integer :student_id
      t.integer :teacher_id
      t.integer :session_id
    end
  end
end

