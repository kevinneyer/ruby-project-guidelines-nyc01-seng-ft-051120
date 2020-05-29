require_relative '../config/environment'

class TeacherController
    attr_accessor :teacher, :teach
    def initialize(teach)
        @teacher=teacher
        @teach=teach
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
            puts "2. View my students"
            puts "\n-----------------------------------------\n"
            puts "3. Show my students' grades"
            puts "\n-----------------------------------------\n"
            puts "4. Create a bulletin board announcement"
            puts "\n-----------------------------------------\n"
            puts "5. View all of my announcements"
            puts "\n-----------------------------------------\n"
            puts "6. See school's top students"
            puts "\n-----------------------------------------\n"
            puts "7. Logout out of teacher"
            puts "\n-----------------------------------------\n"
            
              response = gets.chomp
              case response 
              when "1"
               puts "\n******************************\n "
               if teach.my_sessions
               puts "\n #{teach.my_sessions} \n"
               else puts  "You have no seesions \n Please contact admin to add session"
               puts "\n***************************"
               end
              when "2"
                puts "\n******************************\n"
                if teach.my_students
                 puts teach.my_students
                else puts "You have no student now \n Please contact admin to add session"
                 puts "\n******************************\n"
                end
              when "3"
                puts "\n******************************\n"
                if  teach.student_gpas
                  puts teach.student_gpas
                else puts "You have no student now \n Please contact admin to add session"
                puts "\n******************************\n"
                end
              when "4"
                puts "\n******************************\n"
                  puts announcement
                puts "\n******************************\n"
              
              when "5"
                puts "\n******************************\n"
                if teach.my_announcement
                  puts teach.my_announcement
                else puts "You have no student now \n Please contact admin to add session"
                  puts "\n******************************\n"
                end
              when "6"
                puts "\n******************************\n"
                puts Student.top_student
                puts "\n******************************\n"
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
          an=Announcement.create(title: title, content: content)
          BulletinBoard.create(announcement_id: an.id, teacher_id: teach.id)
          puts "The following announcement is posted" 
          "Title: #{an.title}\nContent: #{an.content}"
        end

        def exit_app
          puts "\nYou are now logged out of user.\n"
        end
  


     
















end