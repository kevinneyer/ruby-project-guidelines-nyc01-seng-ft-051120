class CreateBulletinBoards < ActiveRecord::Migration[5.0]
  def change
    create_table :bulletin_boards do |t|
      t.integer :announcement_id
      t.integer :teacher_id
    end
  end
end
