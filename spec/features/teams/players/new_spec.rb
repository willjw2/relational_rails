# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe 'Team player creation' do
  it 'links to a new player page from the team players index page' do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)

    visit "/teams/#{team.id}/players"

    click_button('Create Player')
    expect(current_path).to eq("/teams/#{team.id}/players/new")
  end
  it 'can create a new player' do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)

    visit "/teams/#{team.id}/players/new"

    fill_in('Name', with: 'Seiya Suzuki')
    fill_in('Age', with: 28)
    fill_in('Retired?', with: false)

    click_button('Create Player')

    expect(current_path).to eq("/teams/#{team.id}/players")
    expect(page).to have_content("Seiya Suzuki")
  end
end
