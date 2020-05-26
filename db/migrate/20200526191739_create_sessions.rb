class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.string :location
      t.datetime  :start_time
      t.datetime :end_time
    end
  end
end
