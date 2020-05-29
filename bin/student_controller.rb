require_relative '../config/environment'
class StudentController
    attr_accessor :student, :st
    def initialize(st)
        @student=student
        @st=st
        run
    end
    
    def run
      puts "\n-----------------------------------------\n"
      puts "Welcome! Please select what you'd like to do!"
       puts "\n-----------------------------------------\n"
        while true do
          puts "\n-----------------------------------------\n"
          puts "1. View my class sessions"
          puts "\n-----------------------------------------\n"
          puts "2. View my Teachers"
          puts "\n-----------------------------------------\n"
          puts "3. Show my grades"
          puts "\n-----------------------------------------\n"
          puts "4. Show study group sessions"
          puts "\n-----------------------------------------\n"
          puts "5. Create study group session"
          puts "\n-----------------------------------------\n"
          puts "6. See top student"
          puts "\n-----------------------------------------\n"
          puts "7. See all student"
          puts "\n-----------------------------------------\n"
          puts "8. Logout of student"
          puts "\n-----------------------------------------\n"
          
            response = gets.chomp
            case response 
            when "1"
            puts "\n-----------------------------------------\n"
            puts "\n #{st.view_sessions} \n"
            puts "\n-----------------------------------------\n"
            when "2"
              puts "\n******************************\n "
               puts st.view_teachers
               puts "\n******************************\n "
            when "3"
              puts "\n******************************\n "
                puts st.my_result
                puts "\n******************************\n "
            when "4"
              puts "\n******************************\n "
                puts st.my_group_session
                puts "\n******************************\n "
            when "5"
                join_group
            when "6"
              puts "\n******************************\n "
              puts Student.top_student
              puts "\n******************************\n "
            when "7"
              puts "\n******************************\n "
             puts  Student.whole_school
             puts "\n******************************\n "
            when "8"
              puts "\n******************************\n "
            exit_app
            puts "\n******************************\n "
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