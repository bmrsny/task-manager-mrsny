require 'rails_helper'

RSpec.describe "TasksEdits", type: :request do
  describe "user can edit a list" do
    it "can update a list" do
      @list = List.create(title: "my list")

      visit lists_path
      click_link "my list"

      expect(current_path).to eq(list_path(@list))

      click_link "Edit your List"

      fill_in "list[title]", with: "list"
      click_link_or_button "Submit"

      expect(current_path).to eq(lists_path)
      expect(page).to have_content("list")
    end
  end
end
