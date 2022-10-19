require 'rails_helper'

RSpec.describe 'the players show page' do
  it "displays the player's name" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)

    visit "/players/#{player.id}"

    expect(page).to have_content(player.name)
    expect(page).to_not have_content(player_2.name)
  end
  it "displays the team name of the player" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)

    visit "/players/#{player.id}"

    expect(page).to have_content(team.name)
  end
  it "displays the attributes of the player" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)

    visit "/players/#{player.id}"
    
    expect(page).to have_content(player.name)
    expect(page).to have_content(player.age)
    expect(page).to have_content("Retired?: false")
  end
end
