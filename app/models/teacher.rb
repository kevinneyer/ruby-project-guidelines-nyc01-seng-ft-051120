class Teacher < ActiveRecord::Base
  has_many :classrooms
  has_many :sessions, through: :classrooms
  has_many :students, through: :classrooms

  def self.all_teachers
    Teacher.all  
  end

  

end