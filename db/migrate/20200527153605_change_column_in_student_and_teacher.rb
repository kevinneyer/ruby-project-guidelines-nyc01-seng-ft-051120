class ChangeColumnInStudentAndTeacher < ActiveRecord::Migration[5.0]
  def change
    add_column :students, :user_name, :string
    add_column :students, :password, :string

    add_column :teachers, :user_name, :string
    add_column :teachers, :password, :string
  end
end
