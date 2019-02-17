module Types
  class QueryType < Types::BaseObject
    field :task, TaskType, null: true do
      description "Find a task by ID"
      argument :id, ID, required: true
    end
  
    def task(id:)
      Task.find(id)
    end
    field :tasks, [TaskType], null: true do
      description "List all tasks"
    end

    def tasks
      Task.all
    end
  end
end
