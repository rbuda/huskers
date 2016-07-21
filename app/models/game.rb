class Game < ActiveRecord::Base
  validates :home_team, presence: true
  validates :away_team, presence: true
  validates :date, presence: true


end
