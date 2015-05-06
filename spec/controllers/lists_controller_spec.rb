require "rails_helper"

RSpec.describe ListsController, type: :controller do

  describe "List Controller actions" do
    it "#index" do
      @list = List.create(title: "my list")
      get :index

      expect(List.count).to eq(1)
      expect(response.status).to eq(200)
    end
  end

  it "#create" do
    attributes = {title: "my list"}
    post :create, id: 1, list: attributes

    expect(response.status).to eq(302)
    expect(List.first.title).to eq("my list")
  end
end
