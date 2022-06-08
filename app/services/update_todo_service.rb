class UpdateTodoService
  def initialize(todo)
    @todo = todo
  end

  # @params [Hash] params The params to update the Todo record
  def call(params:)
    Todo.transaction do
      @todo.attributes = params

      if @todo.status_changed?
        @todo.activity_logs.create!(attribute_changes: @todo.changes)
      end

      @todo.save!
    end
  end
end
