require 'rails_helper'

RSpec.describe 'teams edit' do
  it 'links to the edit page' do
    team = Team.create!(name: "Chicago Cubs", wins: 74, losses: 88, active: true)
    visit '/teams'

    click_button "Edit #{team.name}"

    expect(current_path).to eq("/teams/#{team.id}/edit")
  end
  it 'can edit the team' do
    team = Team.create!(name: "Chicago C", wins: 74, losses: 88, active: true)
    visit '/teams'
    expect(page).to have_content("Chicago C")

    click_button 'Edit Chicago C'
    
    fill_in 'name', with: 'Chicago Cubs'
    fill_in 'wins', with: 74
    fill_in 'losses', with: 88
    fill_in 'active', with: true

    click_button 'Update Team'

    expect(current_path).to eq("/teams")

    expect(page).to have_content('Chicago Cubs')
  end
end
