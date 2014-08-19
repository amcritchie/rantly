require "rails_helper"

describe "Visiting the home page" do
  it "shows the homepage" do
    visit root_path

    expect(page).to have_content("Rantly")
    expect(page).to have_content("Let it all out")
    expect(page).to have_content("Jeff Taggart")
    expect(page).to have_content("Rantly has allowed")
  end
end

describe "Registering with Rantly. =>" do
  it "clicking the join button." do
    visit root_path

    click_link "Join"

    save_and_open_page

    expect(page).to have_content("Username")
  end
end
