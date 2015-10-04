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

class Task < ActiveRecord::Base
  has_closure_tree order: 'sort_order'
  belongs_to :user
  validates_presence_of :name

  default_scope { order(sort_order: :asc) }

  def done?
    !!done_at
  end

  def done
    done?
  end

  def mark_as_done
    self.done_at = DateTime.current
  end

  def mark_as_not_done
    self.done_at = nil
  end
end
