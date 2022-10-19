# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information

require 'rails_helper'

RSpec.describe 'players edit' do
  it 'links to players edit page' do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    player = team.players.create!(name: "Kyle Hendricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)
    visit "/players/#{player.id}"

    click_button 'Update Player'

    expect(current_path).to eq("/players/#{player.id}/edit")
  end
  it 'can edit the player' do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    player = team.players.create!(name: "Kyle Hundricks", age: 32, retired: false)
    player_2 = team.players.create!(name: "Seiya Suzuki", age: 28, retired: false)

    visit "/players/#{player.id}"
    expect(page).to have_content("Kyle Hundricks")
    # save_and_open_page
    click_button 'Update Player'

    fill_in 'name', with: 'Kyle Hendricks'
    fill_in 'age', with: 32
    fill_in 'retired', with: false

    click_button 'Update Player'
    expect(current_path).to eq("/players/#{player.id}")
    expect(page).to have_content("Kyle Hendricks")
    # save_and_open_page
  end
end
