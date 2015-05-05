require 'rails_helper'

RSpec.describe List, type: :model do
  it { should validate_presence_of(:title) }
  it { should have_many(:tasks)}

  it "filters all lists by archived false" do
    @list1 = List.create(title: "not archived", archived: false)
    @list2 = List.create(title: "archived", archived: true)

    expect(List.not_archived).to include(@list1)
    expect(List.not_archived).to_not include(@list2)
  end
end
