require 'rails_helper'

RSpec.describe "CompletedTasks", type: :request do
  describe "GET /completed_tasks" do
    it "User can see all completed tasks" do
      @task1 = Task.create(title: "yay", description: "yy" ,status: true)
      @task2 = Task.create(title: "yay", description: "yy", status: false)
      visit complete_tasks_path

      expect(page).to have_content(@task1.title)
      expect(page).to have_content(@task2.title)
    end
  end
end
