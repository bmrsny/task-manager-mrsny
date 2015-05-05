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

  it "can destroy a archived list" do
    @list = List.create(title: "mine", archived: true)
    visit archive_lists_path

    expect(page).to have_content(@list.title)

    click_link_or_button "Delete"

    expect(page).to_not have_content(@list.title)
  end
end
