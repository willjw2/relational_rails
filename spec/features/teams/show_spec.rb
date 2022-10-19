require 'rails_helper'

RSpec.describe 'the teams show page' do
  it "displays the team's name" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    team_2 = Team.create!(name: "Chicago Bears", wins: 2, losses: 4, active: true)

    visit "/teams/#{team.id}"

    expect(page).to have_content(team.name)
    expect(page).to_not have_content(team_2.name)
  end
  it "displays the attributes of the team" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    team_2 = Team.create!(name: "Chicago Bears", wins: 2, losses: 4, active: true)

    visit "/teams/#{team.id}"

    expect(page).to have_content(team.wins)
    expect(page).to have_content(team.losses)
    expect(page).to have_content("Active?: true")
  end
  it "links to the team's players page" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)

    visit "/teams/#{team.id}"

    expect(page).to have_link("Players")
  end
  it "displays the number of players on the team" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
    player_3 = team.players.create!(name: "Test Testguy", age: 100, retired: true)

    visit "/teams/#{team.id}"

    expect(page).to have_content("Number of Players: 3")
  end
end
