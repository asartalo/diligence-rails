class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :done_at, :done
end
