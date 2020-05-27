require_all './app/models'


Teacher.delete_all 
Student.delete_all
Session.delete_all
Classroom.delete_all

t0=Teacher.create(user_name: "dd", password:"123",name: "Joe",subject:"English")
t1=Teacher.create(name: "Kelly",subject:"Social Studies")
t2=Teacher.create(name: "Bob",subject:"Science" )
Teacher.create(name: "Charlie",subject:"Computer" )
Teacher.create(name: "Chris",subject:"Music" )
Teacher.create(name: "Emmy",subject:"Computer")
Teacher.create(name: "Diana",subject:"English")

s0=Student.create(name: "Josh", grade: 12, gpa: 3.2, user_name: "bb", password: "123")
s1=Student.create(name: "Josh2", grade: 1, gpa: 3.7)
s2=Student.create(name: "Kevin", grade: 2, gpa: 3.1)
Student.create(name: "Lily", grade: 11, gpa: 2.2)
Student.create(name: "Asha", grade: 10, gpa: 1.2)
Student.create(name: "Pinto", grade: 9, gpa: 3.5)
Student.create(name: "Harry", grade: 8, gpa: 3.9)
Student.create(name: "Jabish", grade: 7, gpa: 3.9)

Session.create(location: "2b")
se0=Session.create(location: "3b")
Session.create(location: "2a")
Session.create(location: "2c")
Session.create(location: "4c")
Session.create(location: "5a")

Classroom.create(student_id: s0.id, teacher_id: t0.id, session_id: se0.id)
Classroom.create(student_id: s0.id, teacher_id: t1.id , session_id: se0.id)
Classroom.create(student_id: 2, teacher_id: 2, session_id: 2)
Classroom.create(student_id: 1, teacher_id: 4, session_id: 1)
Classroom.create(student_id: 4, teacher_id: 2, session_id: 3)