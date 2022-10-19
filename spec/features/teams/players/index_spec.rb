# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)
require 'rails_helper'

RSpec.describe 'Teams players index' do
  before :each do
    @team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    @player = @team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    @player_2 = @team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
  end
  it 'shows all of the names of the players for the team' do
    visit "/teams/#{@team.id}/players"

    expect(page).to have_content(@player.name)
    expect(page).to have_content(@player_2.name)
  end
  it 'links to each players show page' do
    visit "/teams/#{@team.id}/players"

    click_on @player.name

    expect(current_path).to eq("/players/#{@player.id}")
  end
end
