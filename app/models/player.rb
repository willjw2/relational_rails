class Player < ApplicationRecord
  belongs_to :team

  def self.false_entries
    Player.where("retired = false")
  end
end
