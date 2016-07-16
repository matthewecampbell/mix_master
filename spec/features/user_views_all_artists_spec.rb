require 'rails_helper'

RSpec.feature "User sees all artists" do
  scenario 'artists are in the database and name links to page' do
    artist_name = "Zac Brown"
    artist_image_path = "http://ziegelmeyerphotography.com/wp-content/uploads/2015/11/Zac_Brown_Band_%C2%A92015_Steve_Ziegelmeyer-8459.jpg"
    artist = Artist.create(name: artist_name, image_path: artist_image_path)
    visit artists_path

    expect(page).to have_content artist_name

    click_on artist_name

    expect(current_path).to eq artist_path(artist)
  end
end
