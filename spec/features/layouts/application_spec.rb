require 'rails_helper'

RSpec.describe 'links at top of every page' do
  before :each do
    @team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    @player = @team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    @player_2 = @team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
  end
  it "displays links to indexes at top of every page" do
    visit "/teams/#{@team.id}"
    click_on "Team Index"
    expect(current_path).to eq("/teams")

    visit "/teams/#{@team.id}"
    click_on "Player Index"
    expect(current_path).to eq("/players")

    visit "/teams"
    click_on "Team Index"
    expect(current_path).to eq("/teams")

    visit "/teams"
    click_on "Player Index"
    expect(current_path).to eq("/players")

    visit "/teams/#{@team.id}/players"
    click_on "Team Index"
    expect(current_path).to eq("/teams")

    visit "/teams/#{@team.id}/players"
    click_on "Player Index"
    expect(current_path).to eq("/players")

    visit "/players/#{@player.id}"
    click_on "Team Index"
    expect(current_path).to eq("/teams")

    visit "/players/#{@player.id}"
    click_on "Player Index"
    expect(current_path).to eq("/players")
  end
end
