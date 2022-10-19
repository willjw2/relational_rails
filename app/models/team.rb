class Team < ApplicationRecord
  has_many :players

  def self.sort_by_recently_created
    Team.order(created_at: :desc)
  end
end
