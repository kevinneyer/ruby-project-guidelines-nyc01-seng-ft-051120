require_relative '../config/environment'
class StudentController
    attr_accessor :student
    def initialize(student)
        @student=student
        run
    end
    
    def run
      puts "Welcome! Please select what you'd like to do!"
        while true do
          puts "1. View my class sessions"
          puts "2. View my Teachers"
          puts "3. Show my grades"
          puts "4. Show study group sessions"
          puts "5. Create study group session"
          puts "6. See top student"
          puts "7. See all student"
          
            response = gets.chomp
            case response 
            when "1"
             puts "\n******************************\n #{student.view_sessions} \n***************************"
            when "2"
               puts student.view_teachers
            when "3"
                puts student.my_result
            when "4"
                puts student.my_group_session
            when "5"
                join_group

            when "6"
              puts Student.top_student
            when "7"
             puts  Student.whole_school
            when "logout"
            exit_app
            break
            end
        end
      end
      
    def join_group
      puts "where do you want to have your group session?"
        location=gets.chomp.to_s
        puts "what do you want to study in group session?"
          subject=gets.chomp.to_s
          student.create_study_group(location, subject)
        end
      
      def exit_app
        puts "Goodbye!"
      end


end