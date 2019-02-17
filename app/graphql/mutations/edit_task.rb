module Mutations
  class EditTask < BaseMutation
    argument :id, ID, required: true
    argument :title, String, required: true
    field :task, Types::TaskType, null: false
    field :errors, [String], null: false

    def resolve(id:, title:)
      task = Task.find(id)
      if task.update(title: title)
        {
          task: task,
          errors: [],
        }
      else
        {
          task: task,
          errors: task.errors.full_messages,
        }
      end
    end
  end
end
