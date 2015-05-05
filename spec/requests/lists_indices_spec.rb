require 'rails_helper'

RSpec.describe "ListsIndices", type: :request do
  describe "GET /lists_indices" do
    it "lists index page" do
      @list2 = List.create(title: "first list", archived: true)
      @list = List.create(title: "my list")
      visit lists_path

      expect(page).to have_content("my list")
      expect(page).to_not have_content("first list")
    end
  end
end
