module Mutations
  class DeleteTask < BaseMutation
    argument :id, ID, required: true
    field :id, Int, null: false
    field :errors, [String], null: false

    def resolve(id:)
      task = Task.find(id)
      if task.destroy
        {
          id: id,
          errors: [],
        }
      else
        {
          id: nil,
          errors: task.errors.full_messages,
        }
      end
    end
  end
end
