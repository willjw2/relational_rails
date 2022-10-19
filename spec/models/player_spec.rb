require 'rails_helper'

RSpec.describe Player do
  it {should belong_to :team}

  describe 'false_entries' do
    it 'returns entries where retired is false' do
      team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
      player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
      player_1 = team.players.create!(name: "test", age: 2, retired: true)
      player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
      player_3 = team.players.create!(name: "idk", age: 100, retired: true)
      expect(Player.false_entries).to eq([player, player_2])
    end
  end
end
