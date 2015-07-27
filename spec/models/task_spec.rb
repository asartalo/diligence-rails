require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:task) { build_stubbed :task }
  it { should validate_presence_of(:name) }
  it { should belong_to(:user) }

  it "is not done by default" do
    expect(task.done?).to be(false)
  end

  context "when marked as done" do
    before { task.mark_as_done }

    it "is done" do
      expect(task.done?).to be(true)
    end

    context "when marked as not done" do
      before { task.mark_as_not_done }

      it "is not done" do
        expect(task.done?).to be(false)
      end
    end
  end

end

