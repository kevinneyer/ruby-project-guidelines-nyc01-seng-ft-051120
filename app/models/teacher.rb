class Teacher < ActiveRecord::Base
  has_many :classrooms
  has_many :sessions, through: :classrooms
  has_many :students, through: :classrooms

  def self.all_teachers
    Teacher.all  
  end

  def my_sessions #returning dupicates. maybe check?
    empty = []
    Classroom.all.each do |sessions|
       if sessions.teacher == self
        empty << sessions.session  
       end
      end
      empty
    end

    def my_students #returning duplicates. check
      my_sessions.map do |ses|
        ses.students 
      end
    end

    def grade_student(student_id, gpa) #funny
      Classroom.all.each do |student|
        if student.student.id==student_id && student.teacher == self
          student.student.gpa=gpa
          student.student.save 
          end
        end    
      end

      def student_gpas  #funny
        my_students.map do |st|
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