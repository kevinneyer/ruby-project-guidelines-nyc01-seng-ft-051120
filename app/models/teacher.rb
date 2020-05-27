class Teacher < ActiveRecord::Base
  has_many :classrooms
  has_many :sessions, through: :classrooms
  has_many :students, through: :classrooms

  def self.all_teachers
    Teacher.all  
  end

  def my_sessions 
    empty = []
    Classroom.all.each do |sessions|
       if sessions.teacher == self
        empty << sessions.session  
       end
      end
      empty
    end

    def my_students 
      my_sessions.map do |ses|
        ses.students 
      end
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
        my_students[0].map do |st|
          "#{st.name}: #{st.gpa}" 
        end
      end

      def new_announcement(text, name)
        Announcement.create(title:name, content:text)
      end
      
      def my_announcement
        announcement_array = []
        BulletinBoard.all.each do |board|
         if board.teacher_id==self.id
         announcement_array << board.announcement
         end
       end
       announcement_array
      end

end