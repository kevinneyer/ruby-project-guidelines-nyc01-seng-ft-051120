class BulletinBoard < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :announcement

end