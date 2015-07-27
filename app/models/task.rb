class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name

  default_scope { order(created_at: :desc) }

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
