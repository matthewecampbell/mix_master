require 'rails_helper'

RSpec.feature "User sees all playlists" do
  scenario 'playlists are in the database and user sees all playlists when visit index' do
    playlists = create_list(:playlist_with_songs, 2)

    visit playlists_path

    playlists.each do |playlist|
    expect(page).to have_link playlist.name
    end
  end
end
