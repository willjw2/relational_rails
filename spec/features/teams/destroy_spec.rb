# As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

require 'rails_helper'

RSpec.describe 'destroy team' do
  it 'can delete the team from the team show page' do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    team_2 = Team.create!(name: "Chicago Bulls", wins: 46, losses: 36, active: true)
    player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
    player = team_2.players.create!(name: "Lonzo Ball", age: 24, retired: false)
    player_2 = team_2.players.create!(name: "DeMar DeRozan", age: 33, retired: false)

    visit "/teams/#{team.id}"

    click_button 'Delete'

    expect(current_path).to eq('/teams')
    expect(page).to_not have_content('Chicago Cubs')

  end
end
