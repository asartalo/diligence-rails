require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:task) { create :task }
  it { should validate_presence_of(:name) }
  it { should belong_to(:user) }

  it "is not done by default" do
    expect(task.done?).to be(false)
  end

  context "when marked as done" do
    before { task.done }

    it "is done" do
      expect(task.done?).to be(true)
    end
  end

end

