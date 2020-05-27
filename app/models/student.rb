class Student < ActiveRecord::Base
  has_many :classrooms
  has_many :sessions, through: :classrooms
  has_many :teachers, through: :classrooms
  
  def self.whole_school
    
    self.all.map do |student|
     student.name
    end

  end

  def view_sessions #possible helper for view sessions times/schedule
    ses=[]
    Classroom.all.each do |instance|
    if instance.student_id == self.id
       ses<<[instance.session.id, instance.session.location]
    end
  end
  ses
  end

  def view_teachers
    teachers=[]
    Classroom.all.each do |session|
      if session.student_id==self.id
        teachers<<session.teacher
      end
    end
    teachers
  end

  def add_session(session, teacher)
     new_s = Classroom.create(session_id: session.id, teacher_id: teacher.id, student_id: self.id)
     new_s 
  end

  

  def my_group_session
    StudyGroupSession.all.select do |group_session|
        group_session.student == self
    end
  end

  def create_study_group(location, subject)
    group = StudyGroup.create(location: location, subject: subject)
    join_study_group_session(group)
  end

  def join_study_group_session(study_group)
    StudyGroupSession.create(student_id: self.id, study_group_id: study_group.id)
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