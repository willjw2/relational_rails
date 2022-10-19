require 'rails_helper'

RSpec.describe 'the teams index page' do
  it "displays names of all of the teams" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    team_2 = Team.create!(name: "Chicago Bears", wins: 2, losses: 4, active: true)

    visit "/teams"
    expect(page).to have_content(team.name)
    expect(page).to have_content(team_2.name)
  end

  it "displays the teams sorted by most recently created" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    team_2 = Team.create!(name: "Chicago Bears", wins: 2, losses: 4, active: true)

    visit "/teams"
    expect("Chicago Bears").to appear_before("Chicago Cubs", only_text: true)
  end

  it "displays when each team was created" do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    team_2 = Team.create!(name: "Chicago Bears", wins: 2, losses: 4, active: true)

    visit "/teams"

    expect(page).to have_content(team.created_at)
    expect(page).to have_content(team_2.created_at)
  end
end
