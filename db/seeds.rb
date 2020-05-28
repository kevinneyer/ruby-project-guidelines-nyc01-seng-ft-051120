require_all './app/models'


Teacher.delete_all 
Student.delete_all
Session.delete_all
Classroom.delete_all
Announcement.delete_all
BulletinBoard.delete_all
StudyGroupSession.delete_all
StudyGroup.delete_all



t0=Teacher.create(user_name: "dd", password:"123",name: "Joe",subject:"English")
t1=Teacher.create(name: "Kelly",subject:"Social Studies")
t2=Teacher.create(name: "Bob",subject:"Science" )
t3=Teacher.create(name: "Charlie",subject:"Computer" )
t4=Teacher.create(name: "Chris",subject:"Music" )
t5=Teacher.create(name: "Emmy",subject:"Computer")
t6=Teacher.create(name: "Diana",subject:"English")

s0=Student.create(name: "Josh", grade: 12, gpa: 3.2, user_name: "bb", password: "123")
s1=Student.create(name: "Josh2", grade: 1, gpa: 3.7)
s2=Student.create(name: "Kevin", grade: 2, gpa: 3.1)
s3=Student.create(name: "Lily", grade: 11, gpa: 2.2)
s4=Student.create(name: "Asha", grade: 10, gpa: 1.2)
s5=Student.create(name: "Pinto", grade: 9, gpa: 3.5)
s6=Student.create(name: "Harry", grade: 8, gpa: 3.9)
s7=Student.create(name: "Jabish", grade: 7, gpa: 3.9)

se1=Session.create(location: "2b")
se0=Session.create(location: "3b")
se2=Session.create(location: "2a")
se3=Session.create(location: "2c")
se4=Session.create(location: "4c")
se5=Session.create(location: "5a")

Classroom.create(student_id: s0.id, teacher_id: t0.id, session_id: se0.id)
Classroom.create(student_id: s4.id, teacher_id: t0.id , session_id: se0.id)
Classroom.create(student_id: s3.id, teacher_id: t0.id, session_id: se0.id)
Classroom.create(student_id: s2.id, teacher_id: t2.id, session_id: se1.id)
Classroom.create(student_id: s1.id, teacher_id: t4.id, session_id: se1.id)

sg0=StudyGroup.create(location: "34b", subject: "Science 101", remarks: "bring snacks!")
sg7=StudyGroup.create(location: "45b", subject: "Ruby 101", remarks: "bring your laptop")
sg1=StudyGroup.create(location: "35a", subject: "Computer 101", remarks: "no mobile")
sg2=StudyGroup.create(location: "102m", subject: "Maths 101", remarks: "bring textbook!")
sg3=StudyGroup.create(location: "11m", subject: "Science 101", remarks: "Bring notes!")
sg4=StudyGroup.create(location: "34b", subject: "Maths 101", remarks: "bring water!")
sg5=StudyGroup.create(location: "34b", subject: "History 101", remarks: "bring snacks!")
sg6=StudyGroup.create(location: "2828p", subject: "Social 101", remarks: "bring snacks!")

sgs0=StudyGroupSession.create(student_id: s0.id, study_group_id: sg7.id)
sgs0=StudyGroupSession.create(student_id: s1.id, study_group_id: sg7.id)
sgs0=StudyGroupSession.create(student_id: s2.id, study_group_id: sg7.id)
sgs0=StudyGroupSession.create(student_id: s3.id, study_group_id: sg2.id)
sgs0=StudyGroupSession.create(student_id: s4.id, study_group_id: sg2.id)
sgs0=StudyGroupSession.create(student_id: s5.id, study_group_id: sg2.id)

an0=Announcement.create(title: "Leadership Work Shop", content: "Leadership workshop content")
an1=Announcement.create(title: "Talent Show", content: "Talent Show content")
an2=Announcement.create(title: "Teachers' Day", content: "Teachers' Day content")
an3=Announcement.create(title: "Mothers' Day", content: "Mothers' Day content")
an4=Announcement.create(title: "Independence Day!", content: "Independence Day!content")
an5=Announcement.create(title: "Career Seesion", content: "Career Seesion content")

BulletinBoard.create(teacher_id: t1.id, announcement_id: an0.id)
BulletinBoard.create(teacher_id: t1.id, announcement_id: an1.id)
BulletinBoard.create(teacher_id: t1.id, announcement_id: an2.id)