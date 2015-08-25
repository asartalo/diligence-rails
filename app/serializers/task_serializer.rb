class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :done_at, :done, :created_at
end
