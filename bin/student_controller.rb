require_relative '../config/environment'
class StudentController
    attr_accessor :student, :st
    def initialize(st)
        @student=student
        @st=st
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
          puts "8. Logout of student"
          
            response = gets.chomp
            case response 
            when "1"
             puts "\n******************************\n \n #{st.view_sessions} \n\n***************************"
            when "2"
               puts st.view_teachers
            when "3"
                puts st.my_result
            when "4"
                puts st.my_group_session
            when "5"
                join_group
            when "6"
              puts Student.top_student
            when "7"
             puts  Student.whole_school
            when "8"
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
        puts "any remarks for your friends?"  
          remarks = gets.chomp.to_s
          st.create_study_group(location, subject, remarks)
        end
      
      def exit_app
        puts "You are now logged out of Student. Type \"exit\" to leave the program."
      end


end