class Announcement < ActiveRecord::Base
  has_many :bulletin_boards
  has_many :teachers, through: :bulletin_boards

  def self.new_announcement
     Announcment.last
  end

  def self.all_announcements
    Announcement.all
  end


end