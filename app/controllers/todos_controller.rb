class TodosController < ApplicationController
  respond_to :html

  # GET /todos
  def index
    @todos = Todo.order(:id)

    respond_with @todos
  end

  # GET /todos/new
  def new
    @todo = Todo.new

    respond_with @todo
  end

  # PUT /todos/:id
  def update
    @todo = Todo.find(params[:id])

    UpdateTodoService.new(@todo).call(params: update_params)

    redirect_to controller: :todos, action: :index
  rescue ActiveRecord::RecordInvalid => error
    @todos = Todo.order(:id)

    render :index
  end

  # POST /todos
  def create
    @todo = Todo.new(create_params)

    @todo.save!

    redirect_to controller: :todos, action: :index

  rescue ActiveRecord::RecordInvalid => error
    render :new
  end

  private

  # @return [Hash]
  def create_params
    params.require(:todo).permit(:title, :description, :status, :due_date)
  end

  # @return [Hash]
  def update_params
    params.require(:todo).permit(:status, :due_date)
  end
end
