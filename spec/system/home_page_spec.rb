require 'rails_helper'
include ApplicationHelper

# OmniAuth.config.mock_auth[:facebook]
RSpec.describe HomeController, type: :system do
  before do
    driven_by(:rack_test)
  end

  feature "omniauth-facebook" do
    scenario "User visit homepage and see their user name" do
      visit root_path
      if page.current_path == login_path
        click_button "Đăng nhập với Facebook"
      end
      expect(page).to have_current_path root_path
    end
  end

  context "User logged in and start adding client info" do
    before :each do
      visit login_path
      click_button "Đăng nhập với Facebook"
    end

    scenario "Add a valid client" do
      visit root_path
      click_button "Khách hàng mới"
      fill_in "Tên khách hàng",	with: Faker::Name.name
      fill_in "Số điện thoại", with: Faker::PhoneNumber.phone_number
      fill_in "Thời gian", with: DateTime.now + 1.hour
      fill_in "Ghi chú", with: "Tại nhà riêng"
      click_button "Thêm mới"
      expect(page).to have_text "Thêm thành công"
    end

    context "Add invalid clients" do
      scenario 'without name' do
        visit root_path
        click_button "Khách hàng mới"
        # fill_in "Tên khách hàng",	with: Faker::Name.name
        fill_in "Số điện thoại", with: Faker::PhoneNumber.phone_number
        fill_in "Thời gian", with: DateTime.now + 1.hour
        fill_in "Ghi chú", with: "Tại nhà riêng"
        click_button "Thêm mới"
        expect(page).to have_text "Tên khách hàng không được bỏ trống"
      end

      scenario 'without time' do
        visit root_path
        click_button "Khách hàng mới"
        fill_in "Tên khách hàng",	with: Faker::Name.name
        fill_in "Số điện thoại", with: Faker::PhoneNumber.phone_number
        # fill_in "Thời gian", with: DateTime.now + 1.hour
        fill_in "Ghi chú", with: "Tại nhà riêng"
        click_button "Thêm mới"
        expect(page).to have_text "Không bỏ trống thời gian"
      end
    end
  end
end
