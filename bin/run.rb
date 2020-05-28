require_relative '../config/environment'

def run
    while true do
      puts "Welcome! Please enter a command.
       *Hint: type help for options*"
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
  
  def students
    puts "1. View my class sessions"
    puts "2. Add a class session"
    puts "3. View my teachers"
    puts "4. Show study group sessions"
    puts "5. Join study group session"
    puts "6. Create study group session"
    puts "7. Show my grades"
    response = gets.chomp
    case response 
    when "1"
      puts "user:"
      user = gets.to_s
      puts "password"
      puts user 
      password = gets.to_s 
      puts password
      Student.login(user, password)
    when "2"
       puts Student.whole_school
    when "3"
       puts "name:"
       name = gets.to_s
       puts "grade:"
       grade = gets.to_i
       puts "gpa:"
       gpa = gets.to_f
       puts "user name:"
       user_name = gets.to_s
       puts "password"
       password = gets.to_s
       Student.sign_up(name, grade, gpa, user_name, password)
    end  
    end

  def teachers
    puts "1. View my class sessions"
    puts "2. View my student"
    puts "3. Grade a student"
    puts "4. Show my students' grades"
    puts "5. Write new bulletin board announcement"
    puts "6. View my announcements"
  end

  def help
    puts "Help Options: "
    puts  "- help : displays this help message"
    puts  "- teacher : displays what a teacher can do"
    puts  "- student : displays what a student can do"
    puts  "- exit : exits this program"
  end

  def exit_app
    puts "Goodbye!"
  end

    run
    # students
    # help 

# puts "HELLO WORLD"
