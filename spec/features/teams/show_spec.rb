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
end
