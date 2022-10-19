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
end
