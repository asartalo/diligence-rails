class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name

  default_scope { order(created_at: :desc) }

  def done?
    !!@done_at
  end

  def done
    @done_at = DateTime.current
  end
end
