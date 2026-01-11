class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
       :registerable,
       :recoverable,
       :rememberable,
       :validatable
  has_one_attached :photo
  enum :role, { member: 0, super_admin: 1, admin: 2, minister: 3, state_minister: 4, director: 5, desk_leader: 6, team_leader: 7, employee: 8, clerk: 9, partner_admin: 10, partner: 11, receptionist: 12 }
end
