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
               puts "\n #{teach.my_sessions} \n"
               puts "\n***************************"
              when "2"
                puts "\n******************************\n"
                 puts teach.my_students
                 puts "\n******************************\n"
              when "3"
                puts "\n******************************\n"
                  puts teach.student_gpas
                puts "\n******************************\n"
              when "4"
                puts "\n******************************\n"
                  puts announcement
                puts "\n******************************\n"
              when "5"
                puts "\n******************************\n"
                  puts teach.my_announcement
                  puts "\n******************************\n"
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