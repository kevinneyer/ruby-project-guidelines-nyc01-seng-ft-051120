require 'pry'
class Student < ActiveRecord::Base
  has_many :classrooms
  has_many :sessions, through: :classrooms
  has_many :teachers, through: :classrooms
  
  def self.login(user, password)
    if Student.find_by(user_name: user)
      if Student.find_by(user_name: user).password == password
      puts "\nLogin Successful!\n"
      return  Student.find_by(user_name: user)
    else
      puts "Incorrect Password, Please try again!"
    end
    else
      puts "No user found" 
    end
   
    
  end

  def self.sign_up(name, grade, gpa, user_name, password)
    Student.create(name: name, grade: grade, user_name: user_name, password: password)
    puts "Register successful, #{name}"
  end
  
  def self.whole_school
    self.all.map do |student|
     student.name
    end
  end

  def view_sessions 
    ses = "Your session(s) are in the following: "
    Classroom.all.each do |instance|
    if instance.student_id == self.id
       ses += "classroom number #{instance.session.location}. "
    end
  end
  ses + "Don't get lost!"
  end
   
   def view_teachers
    teachers=[]
    Classroom.all.each do |session|
      if session.student_id==self.id
        teachers<<" name: #{session.teacher.name}, subject: #{session.teacher.subject}"
      end
    end
    teachers
  end

  def add_session(session, teacher)
     new_s = Classroom.create(session_id: session.id, teacher_id: teacher.id, student_id: self.id)
     new_s 
  end

  

  def my_group_session
    empty_group = []
    StudyGroupSession.all.each do |group_session|
        if group_session.student == self
        empty_group << "#{group_session.study_group.location}, #{group_session.study_group.subject}, #{group_session.study_group.remarks}"
        end
     end
     empty_group
  end

  def create_study_group(location, subject, remarks)
    group = StudyGroup.create(location: location, subject: subject, remarks: remarks)
    join_study_group_session(group)
  end

  def join_study_group_session(study_group)
    StudyGroupSession.create(student_id: self.id, study_group_id: study_group.id)
  end
  
  def my_result
    if self.gpa<2.0
      "Your current GPA is #{self.gpa}. Result: Failing. You need to boost your grades!"
    else "Your current GPA is #{self.gpa}. Result: Passing. Keep up the good work!"
    end
  end

  def self.top_student
    a=[]
    Student.all.each do |st|
      if st.gpa
      if st.gpa > 3.5
        a << ["Name: #{st.name}, GPA: #{st.gpa}"]
      end
    end
    end
    a.sort
  end


end