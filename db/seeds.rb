require_all './app/models'


Teacher.delete_all 
Student.delete_all
Session.delete_all
Classroom.delete_all

Teacher.create(name: "Joe",subject:"English")
Teacher.create(name: "Kelly",subject:"Social Studies")
Teacher.create(name: "Bob",subject:"Science" )
Teacher.create(name: "Charlie",subject:"Computer" )
Teacher.create(name: "Chris",subject:"Music" )
Teacher.create(name: "Emmy",subject:"Computer")
Teacher.create(name: "Diana",subject:"English")

Student.create(name: "Josh", grade: 12, gpa: 3.2)
Student.create(name: "Josh2", grade: 1, gpa: 3.7)
Student.create(name: "Kevin", grade: 2, gpa: 3.1)
Student.create(name: "Lily", grade: 11, gpa: 2.2)
Student.create(name: "Asha", grade: 10, gpa: 1.2)
Student.create(name: "Pinto", grade: 9, gpa: 3.5)
Student.create(name: "Harry", grade: 8, gpa: 3.9)
Student.create(name: "Jabish", grade: 7, gpa: 3.9)

Session.create(location: 2b, start_time: Time.now, end_time: Time.now)

Classroom.create(student_id: 1, teacher_id: 2, session_id: 3)
Classroom.create(student_id: 3, teacher_id: 1, session_id: 2)
Classroom.create(student_id: 2, teacher_id: 2, session_id: 2)
Classroom.create(student_id: 1, teacher_id: 4, session_id: 1)
Classroom.create(student_id: 4, teacher_id: 2, session_id: 3)