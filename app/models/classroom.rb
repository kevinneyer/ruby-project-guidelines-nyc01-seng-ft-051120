class Classroom < ActiveRecord::Base
    belongs_to :session
    belongs_to :student
    belongs_to :teacher
end