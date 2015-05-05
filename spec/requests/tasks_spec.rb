require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /tasks" do
    it "can see all lists tasks" do
      @list = List.create(title: "my list")
      @task = Task.create(title: "go to store", description: "buy shit")
      @list.tasks << @task

      visit list_path(@list)
      expect(page).to have_content(@task.title)
      expect(page).to have_content(@task.description)
    end
  end

  it "can create a new task" do
    @list = List.create(title: "list")

    visit list_path(@list)
    click_link_or_button "Create new Task"
    fill_in "task[title]", with: "Store"
    fill_in "task[description]", with: "Go there"
    click_button "Submit"

    expect(page).to have_content("Store")
    expect(page).to have_content("Go there")
  end
end
