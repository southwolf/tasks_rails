module Types
  class MutationType < Types::BaseObject
    field :create_task, mutation: Mutations::CreateTask
    field :edit_task, mutation: Mutations::EditTask
    field :delete_task, mutation: Mutations::DeleteTask
  end
end
