class Pick < ActiveRecord::Base
  belongs_to :user
  belongs_to :game

  validates :winner, presence: true

  foreign_key: "user_id"
  foreign_key: "game_id"

end
