require 'rails_helper'

RSpec.describe 'the players index page' do
  it "displays names of all of the players" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    team_2 = Team.create!(name: "Chicago Bears", wins: 2, losses: 4, active: true)
    player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
    player_3 = team_2.players.create!(name: "idk", age: 100, retired: true)

    visit "/players"

    expect(page).to have_content("Kyle Hendricks")
    expect(page).to have_content("Seiya Suzuki")
    expect(page).to have_content("idk")
  end

  it "displays the attributes of the players" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    team_2 = Team.create!(name: "Chicago Bears", wins: 2, losses: 4, active: true)
    player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
    player_3 = team_2.players.create!(name: "idk", age: 100, retired: true)

    visit "/players"

    expect(page).to have_content("Age: 32")
    expect(page).to have_content("Age: 100")
    expect(page).to have_content("Retired?: true")
  end
end
