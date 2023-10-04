require 'rails_helper'

RSpec.describe "ClickButtons", type: :system do
  before do
    driven_by(:rack_test)
  end

  feature "login" do
    scenario "User click login" do
      visit root_path
      expect(page).to have_text OmniAuth.config.mock_auth[:facebook][:info][:name]
    end
  end
end
