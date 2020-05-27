require_relative 'config/environment'
require 'sinatra/activerecord/rake'
require_relative './app/models/student.rb'
require_relative './app/models/teacher.rb'
require_relative './app/models/classroom.rb'
require_relative './app/models/session.rb'
require_relative './app/models/study_group.rb'
require_relative './app/models/study_group_session.rb'
require_relative './app/models/announcement.rb'
require_relative './app/models/bulletin_board.rb'





desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  Pry.start
end
