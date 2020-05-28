class Teacher < ActiveRecord::Base
  has_many :classrooms
  has_many :sessions, through: :classrooms
  has_many :students, through: :classrooms
  has_many :bulletin_boards
  has_many :announcements, through: :bulletin_boards

  def self.all_teachers
    Teacher.all  
  end

  def self.login(user, password)
    if Teacher.find_by(user_name: user)
      if Teacher.find_by(user_name: user).password == password
      puts "Login Successful!"
    else
      puts "Incorrect Password"
    end
    else
      puts "No user found" 
    end
   return  Teacher.find_by(user_name: user)
end

  def my_sessions 
    empty = ''
    Classroom.all.each do |sessions|
       if sessions.teacher == self
        empty += "Your session is in classroom number #{sessions.session.location}  "
       end
      end
      empty
    end

    def my_students 
      st=''
      Classroom.all.each do |sessions|
        if sessions.teacher == self
        st += "name: #{sessions.student.name} grade: #{sessions.student.grade}\n"
      end
    end
    st
    end

    def grade_student(s_id, gpa) 
      a=[]
      Classroom.all.each do |rooms|
        if rooms.student_id==s_id && rooms.teacher_id == self.id
          rooms.student.gpa=gpa
          rooms.student.save 
          a<<rooms.student
          end
        end
        a    
      end

      def student_gpas 
        st=''
      Classroom.all.each do |sessions|
        if sessions.teacher == self
          st += "name: #{sessions.student.name} GPA: #{sessions.student.gpa}\n"
        end
      end
      st
    end

      def new_announcement(text, name)
        Announcement.create(title:name, content:text)
      end
      
      def my_announcement
       an = []
       BulletinBoard.all.each do |board|
        if board.teacher_id==self.id
          an << board.announcement
        end
      end
      an
      end

end