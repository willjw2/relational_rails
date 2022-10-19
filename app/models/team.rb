class Team < ApplicationRecord
  has_many :players, dependent: :destroy

  def self.sort_by_recently_created
    Team.order(created_at: :desc)
  end

  def player_count
    players.count
  end
end
