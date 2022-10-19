require 'rails_helper'

RSpec.describe Team do
  it {should have_many :players}

  describe 'sort_by_recently_created' do
    it 'returns teams ordered by most recent creation' do
      cubs = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
      eagles = Team.create!(name: "Philadelphia Eagles", wins: 6, losses: 0, active: true)
      bears = Team.create!(name: "Chicago Bears", wins: 2, losses: 4, active: true)
      expect(Team.sort_by_recently_created).to eq([bears, eagles, cubs])
    end
  end
  describe 'player_count' do
    it 'returns the number of players belonging to the team' do
      team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
      player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
      player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
      player_3 = team.players.create!(name: "Test Testguy", age: 100, retired: true)

      expect(team.player_count).to eq(3)
    end
  end
end
