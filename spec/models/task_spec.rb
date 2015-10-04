# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  done_at    :datetime
#  user_id    :integer
#  parent_id  :integer
#  sort_order :integer
#

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

  context "hierarchy" do
    subject(:grandparent) { create :task }
    let(:parent) { create :task }

    before do
      grandparent.children << parent
    end

    it "has parent as child" do
      expect(grandparent.children.first).to be(parent)
    end

    it "has only one child" do
      expect(grandparent.children.size).to equal(1)
    end

    context "parent" do
      let(:child1) { create :task }
      let(:child2) { create :task }

      before do
        parent.children << child1
        parent.children << child2
      end

      it "has more children" do
        expect(parent.children.size).to equal(2)
      end
    end
  end
end

