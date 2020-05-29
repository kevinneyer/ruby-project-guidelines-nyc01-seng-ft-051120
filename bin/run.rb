require_relative '../config/environment'
require_relative 'student_controller.rb'
require_relative 'teacher_controller.rb'
require 'pry'


def run
    puts "\n-----------------------------------------\n"
    puts "\nWelcome to our School Portal! \n"
    puts "\n-----------------------------------------\n"
    while true do
      puts "\n***** Home Page *****\n"
      puts "\nPlease sign in as either a Teacher or Student."
      puts "Please select from the following options using numbers 1 - 3 as input."
      puts "\n1.) Teacher\n2.) Student\n3.) Exit "
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
        puts "\nNo command exists!\n"
      end
    end 
    puts "\nSee you again soon!"
  end

  def student
    
    while true do 
      puts"\n********************\n Welcome Student!\n********************"
      puts "\nPlease select from the following options using numbers 1 - 3 as input."
      puts "\n1.) Sign in\n2.) Sign up\n3.) Return to Home Page"
      
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
         puts "\nNo command exists!\n"
      end
    end
  end
  
  def student_sign_in
    puts "username:"
    user = gets.strip.to_s
    puts "password:"
    password = gets.chomp.to_s
    s=Student.login(user, password)
    if s
    StudentController.new(s)
    end
  end

  def student_sign_up
    puts "What is your name?"
    name = gets.chomp.to_s
    puts "Your grade please?"
    grade = gets.chomp.to_f
    puts "Create a username"
    username = gets.chomp.to_s
    puts "Choose a password"
    password = gets.chomp.to_s
   stud  = Student.create(name: name, grade: grade, user_name: username, password: password) 
   puts "\nYou are successfully registered!\n"

   StudentController.new(stud)
  end


  def teacher
    
    while true do 
      puts"\n********************\n Welcome Teacher!\n********************"
      puts "\nPlease select from the following options using numbers 1 - 3 as input."
      puts "\n1.) Sign in\n2.) Sign up\n3.) Return to Home Page"
     
      response = gets.chomp.to_s
      case response
      when "1"
       puts "\nPlease enter Username and Password to Login.\n"
        teacher_sign_in
      when "2"
        puts "\nPlease create account providing: Name, Subject, Username and Password.\n"
        teacher_sign_up
      when "3"
        break
        else  
          puts "\nNo command exists!\n"
      end
    end
  end

  def teacher_sign_in
    puts "username:"
    user = gets.strip.to_s
    puts "password:"
    password = gets.chomp.to_s
    t=Teacher.login(user, password)
    if t
    TeacherController.new(t)
    else
    teacher
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
   puts "\nYou are successfully registered!\n"

   TeacherController.new(teach)
  end
  
  run
  