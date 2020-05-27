class Student < ActiveRecord::Base
  has_many :classrooms
  has_many :sessions, through: :classrooms
  has_many :teachers, through: :classrooms
  
  def self.whole_school
    self.all
  end

  def view_sessions #possible helper for view sessions times/schedule
    Session.all.select do |instance|
    instance.student == self
    end
  end

  def view_teachers
    view_sessions.map do |session|
        session.teacher
    end
  end

  def add_session(session, teacher, classroom)
    # Classroom.new(student: self, teacher_id: )
    new_session = Classroom.all.find(classroom.id)
    new_session.teacher_id = teacher.id
    new_session.session_id = session.id 
    new_session.student_id = self.id 
    new_session.save
    new_session
  end

  def delete_session(classroom)
    session_bad = view_sessions.find_by("classroom: classroom ")
    session_bad.delete
    session_bad.save 
  end

  def my_result
    if self.gpa<2.0
      "Your current GPA is: #{self.gpa}, You need to boost your grades! Result: failed!"
    else "Your current GPA is: #{self.gpa}, keep up the good work! Result: Wow Passed!"
    end
  end

  def self.top_student
    Student.all.select do |st|
      st.gpa > 3.5
    end
  end


end