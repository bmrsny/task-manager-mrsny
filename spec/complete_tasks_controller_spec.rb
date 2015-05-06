require "rails_helper"

RSpec.describe CompleteTasksController, type: :controller do

  describe "#update" do
    it "completes a task with ajax" do
      @task = Task.create(title: "mine", description: "mine too", status: false)
      patch :update, id: @task.id

      expect(Task.first.status).to eq(true)
    end
  end
end
