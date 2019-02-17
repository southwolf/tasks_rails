module Mutations
  class CreateTask < BaseMutation
    argument :title, String, required: true
    field :task, Types::TaskType, null: false
    field :errors, [String], null: false

    def resolve(title:)
      task = Task.new(title: title)
      if task.save
        {
          task: task,
          errors: [],
        }
      else
        {
          task: nil,
          errors: task.errors.full_messages,
        }
      end
    end
  end
end
