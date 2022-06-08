module ApplicationHelper
  def todo_status_options(todo = nil)
    options_for_select(Todo.statuses.keys, selected: todo ? todo.status : nil)
  end
end
