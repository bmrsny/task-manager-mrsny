require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of(:title) }

  it { should validate_presence_of(:description) }

  it { should belong_to(:list)}

  it "shows queries for tasks that are not completed" do
    @task1 = Task.create(title:"not completed", description: "nope")
    @task2 = Task.create(title: "completed", description: "yup", status: true)

    expect(Task.not_completed).to include(@task1)
    expect(Task.not_completed).to_not include(@task2)
  end
end
