require_relative '../config/environment'
require_relative 'student_controller.rb'
require_relative 'teacher_controller.rb'
require 'pry'


def run
    puts "\n-----------------------------------------\n"
    puts "\nWelcome to our School Portal! \n"
    while true do
      puts "\n-----------------------------------------\n"
      puts "Please sign in as either a Teacher or Student."
      puts "\n-----------------------------------------\n"
      puts "Please select from the following options using numbers 1 - 3 as input."
      puts "\n-----------------------------------------\n"
      puts "1.) Teacher"
      puts "\n-----------------------------------------\n"
      puts "2.) Student"
      puts "\n-----------------------------------------\n"
      puts "3.) Exit "
      puts "\n-----------------------------------------\n"
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
      puts "Please select from the following options using numbers 1 - 3 as input."
      puts "\n-----------------------------------------\n"
      puts "1.) Sign in"
      puts "\n-----------------------------------------\n"
      puts "2.) Sign up"
      puts "\n-----------------------------------------\n"
      puts "3.) Return to Home Page"
      puts "\n-----------------------------------------\n"
      response = gets.chomp.to_s
      case response
      when "1"
        puts "Please enter Username and Password to Login."
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
    puts "password"
    password = gets.chomp.to_s
    s=Student.login(user, password)
    if s
    StudentController.new(s)
    end
  end

  def student_sign_up
    puts "what is your name?"
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
      puts "\n-----------------------------------------\n"
      puts "1.)Sign In Here"
      puts "\n-----------------------------------------\n"
      puts "2.)Sign up here"
      puts "\n-----------------------------------------\n"
      puts "3.)Return to Home Page"
      puts "\n-----------------------------------------\n"
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
   puts "\nYou are successfully registered!\n"

   TeacherController.new(teach)
  end
  
  run
  