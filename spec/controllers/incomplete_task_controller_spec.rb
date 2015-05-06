require "rails_helper"

RSpec.describe IncompleteTasksController, type: :controller do

  describe "#update" do
    it "marks a completed task as incomplete with ajax" do
      @task = Task.create(title: "mine", description: "mine too", status: true)
      patch :update, id: @task.id

      expect(Task.first.status).to eq(false)
    end
  end
end
