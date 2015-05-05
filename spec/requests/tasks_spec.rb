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

  it "can update a task" do
    @list = List.create(title: "Dig a Hole")
    @task = Task.create(title: "go to store", description: "buy shit")
    @list.tasks << @task

    visit list_path(@list)

    click_link "Update Task"

    expect(current_path).to eq(edit_task_path(@task))

    fill_in "task[title]", with: "bang head here"
    fill_in "task[description]", with: "Why Why Why"
    click_link_or_button "Submit"

    expect(current_path).to eq(list_path(@list))
    expect(page).to have_content("bang head here")
    expect(page).to have_content("Why Why Why")
  end
end
