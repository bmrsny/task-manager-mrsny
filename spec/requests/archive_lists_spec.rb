require 'rails_helper'

RSpec.describe "ArchiveLists", type: :request do
  describe "Archive a list" do
    it "can add a task to archive list" do
      @list = List.create(title: "my list")

      visit lists_path
      #click_link_or_button "Archive"
      first(:button, "Archive").click


      expect(page).to have_content("my list")
    end
  end
end
