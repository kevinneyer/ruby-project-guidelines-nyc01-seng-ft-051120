require_relative '../config/environment'
require_relative 'student_controller.rb'
require_relative 'teacher_controller.rb'
require 'pry'


def run
    puts "\n******************************\n Welcome to our School Portal! \n******************************\n"
    while true do
      puts "Please sign in as either a Teacher or Student."
      puts "Please select from the following options using numbers 1 - 3 as input."
      puts "1.) Teacher\n2.) Student\n3.) Exit "
      #  sign_in
      response = gets.chomp
      case response
      when "1"
       teacher
      when "2"
       student
      when "3"
        break
      else
        puts "No command exists!"
      end
    end 
    puts "See you again!"
  end

  def student
    puts "\n******************************\n Welcome Student! \n******************************\n"
    while true do 
      puts "Please select from the following options using numbers 1 - 3 as input."
      puts "1.) Sign in\n2.) Sign up\n3.) Return to Home Page"
      response = gets.chomp.to_s
      case response
      when "1"
        puts "\nPlease enter Username and Password to Login.\n"
        student_sign_in
      when "2"
        puts "\nPlease create account providing: Name, Grade, Username and Password.\n"
        student_sign_up
      when "3"
        break
        else 
         puts "No command exists!"
      end
    end
  end
  
  def student_sign_in
    puts "username:"
      user = gets.strip.to_s
      puts "password"
      password = gets.chomp.to_s
      s=Student.login(user, password)
      if s
      StudentController.new(s)
      end
  end

  def student_sign_up
    puts "name:"
    name = gets.chomp.to_s
    puts "grade:"
    grade = gets.chomp.to_f
    puts "create username:"
    username = gets.chomp.to_s
    puts "create password:"
    password = gets.chomp.to_s
   stud  = Student.create(name: name, grade: grade, user_name: username, password: password) 
   puts "You are successfully registered!"

   StudentController.new(stud)
  end


  def teacher
    puts "\n******************************\n Welcome Teacher! \n******************************\n"
    while true do 
      puts "1. Sign in"
      puts "2. Sign up"
      puts "3. Return to Home Page"
      response = gets.chomp.to_s
      case response
      when "1"
        teacher_sign_in
      when "2"
        teacher_sign_up
      when "3"
        break
        else  puts "No command exists!"
      end
    end
  end

  def teacher_sign_in
    puts "user:"
      user = gets.strip.to_s
      puts "password"
      password = gets.chomp.to_s
      t=Teacher.login(user, password)
      if t
      TeacherController.new(t)
      end
  end

  def teacher_sign_up
    puts "name:"
    name = gets.chomp.to_s
    puts "subject:"
    subject = gets.chomp.to_s
    puts "create user name:"
    username = gets.chomp.to_s
    puts "create password:"
    password = gets.chomp.to_s
   teach  = Teacher.create(name: name, subject: subject, user_name: username, password: password) 
   puts "You are successfully registered!"

   TeacherController.new(teach)
  end
  run
   
    # students
    # help 

# puts "HELLO WORLD"
