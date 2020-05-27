class StudyGroup < ActiveRecord::Base
  has_many :study_group_sessions
  has_many :students, through: :study_group_sessions

end