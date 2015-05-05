require 'rails_helper'

RSpec.describe "UserCanCreateALists", type: :request do
  describe "GET /user_can_create_a_lists" do
    it "user can create a new list" do
      visit lists_path
      click_link_or_button "Create your new list"
      expect(current_path).to eq(new_list_path)

      fill_in "list[title]", with: "new list"
      click_button "Submit"

      expect(current_path).to eq(lists_path)
      expect(page).to have_content("new list")
    end
  end
end
