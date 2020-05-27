class Teacher < ActiveRecord::Base
  has_many :classrooms
  has_many :sessions, through: :classrooms
  has_many :students, through: :classrooms

  def self.all_teachers
<<<<<<< HEAD
    Teacher.all  
  end

  def my_sessions
     Session.all.select do |sessions|
       sessions.teacher == self
      end
    end

    def my_students
      my_sessions.map do |ses|
        ses.student
      end
    end

    def grade_student(student_id, gpa)
      my_students.each do |student|
        if student.id==student_id
          student.gpa=gpa
          student.save 
          end
        end    
      end

      def student_gpas
        my_students.map do |st|
          "#{st.name}: #{st.gpa}" 
        end
      end
  

=======
    Teacher.all
  end

  def my_sessions
    Session.all.select do |sessions|
      sessions.teacher == self
    end
  end

  def my_students
    my_sessions.map do |ses|
      ses.student
    end
  end

  def grade_student(student_id, gpa)
    my_students.each do |student|
      if student.id==student_id
        student.gpa=gpa
        student.save
      end
    end
  end

  def student_gpas
    my_students.map do |st|
      "#{st.name}: #{st.gpa}" 
    end
  end
  




>>>>>>> 3e92e685052db3de4c6a6e0e17fa288ac8f83acc
end