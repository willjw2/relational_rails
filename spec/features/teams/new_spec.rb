require 'rails_helper'

RSpec.describe 'Creating a new Team' do
  it 'links to the new page from the team index' do
    visit '/teams'

    click_link('New Team')
    expect(current_path).to eq('/teams/new')
  end
  it 'can create a new team' do
    visit '/teams/new'

    fill_in('Name', with: 'Chicago Bulls')
    fill_in('Wins', with: 46)
    fill_in('Losses', with: 36)
    fill_in('Active?', with: true)

    click_button('Create Team')
    # new_team_id = Team.last.id
    expect(current_path).to eq("/teams")
    expect(page).to have_content("Chicago Bulls")
  end
end
