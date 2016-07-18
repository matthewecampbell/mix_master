require 'rails_helper'

RSpec.feature "User can edit an artist" do
  scenario 'artists are in the database and user can edit artist' do
    artist_name = "Zac Brown"
    artist_image_path = "http://ziegelmeyerphotography.com/wp-content/uploads/2015/11/Zac_Brown_Band_%C2%A92015_Steve_Ziegelmeyer-8459.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    visit artists_path

    expect(page).to have_content artist_name

    click_on "Edit artist"

    expect(current_path).to eq edit_artist_path(artist)

    fill_in "artist_name", with: "Billy Joel"
    fill_in "artist_image_path", with: artist_image_path
    click_on "Update Artist"

    expect(current_path).to eq artist_path(artist)

    expect(page).to have_content "Billy Joel"
  end
end
