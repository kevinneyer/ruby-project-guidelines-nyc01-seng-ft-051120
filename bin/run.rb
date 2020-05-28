require_relative '../config/environment'
require_relative 'student_controller.rb'
require 'pry'


def run
    while true do
      puts "Welcome! Please login.
       *Hint: type help for options*"
       sign_in
      response = gets.chomp
      case response
      when "student"
       students 
      when "teacher"
        teachers
      when "help"
        help 
      when "exit"
        exit_app
        break
      else
        puts "No command exists!"
      end
    end
  end
  
  def sign_in
    puts "user:"
      user = gets.strip.to_s
      puts "password"
      password = gets.chomp.to_s
      s=Student.login(user, password)
      if s
      StudentController.new(s)
      end
  end
  

  def exit_app
    puts "Goodbye!"
  end

    run
    # students
    # help 

# puts "HELLO WORLD"
