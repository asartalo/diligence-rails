class Task < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name

  def done?
    !!@done_at
  end

  def done
    @done_at = DateTime.current
  end
end
