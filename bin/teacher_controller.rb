require_relative '../config/environment'

class TeacherController
    attr_accessor :teacher, :teach
    def initialize(teach)
        @teacher=teacher
        @teach=teach
        run
    end

    def run
        puts "Welcome! Please select what you'd like to do!"
          while true do
            puts "1. View my class sessions"
            puts "2. View my students"
            puts "3. Show my students' grades"
            puts "4. Create a bulletin board announcement"
            puts "5. View all of my announcements"
            puts "6. See school's top students"
            puts "7. Logout"
            
              response = gets.chomp
              case response 
              when "1"
               puts "\n******************************\n \n #{teach.my_sessions} \n\n***************************"
              when "2"
                 puts teach.my_students
              when "3"
                  puts teach.student_gpas
              when "4"
                  puts announcement
              when "5"
                  puts teach.my_announcement
              when "6"
                puts Student.top_student
              when "7"
              exit_app
              break
              end
          end
        end

        def announcement
          puts "What is the title of your post?"
          title = gets.chomp.to_s 
          puts "Enter your post content here:"
          content = gets.chomp.to_s
          Announcement.create(title: title, content: content) 
        end


     
















end