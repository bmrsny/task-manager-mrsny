require 'rails_helper'

RSpec.describe "ListsIndices", type: :request do
  describe "GET /lists_indices" do
    it "lists index page" do
      @list = List.create(title: "my list")
      visit lists_path

      expect(page).to have_content("my list")
    end
  end
end
