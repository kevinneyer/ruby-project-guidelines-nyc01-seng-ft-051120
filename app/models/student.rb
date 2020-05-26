class Student < ActiveRecord::Base
  has_many :classrooms
  has_many :sessions, through: :classrooms
  has_many :teachers, through: :classrooms

end