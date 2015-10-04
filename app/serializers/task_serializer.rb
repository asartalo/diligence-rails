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

class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :done_at, :done, :created_at, :sort_order
end
