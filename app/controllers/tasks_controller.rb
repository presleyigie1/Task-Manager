class TasksController < ApplicationController
  def index
    @tasks = Task.all
    @current_month = Date.today.month
    @calendar_start = Date.today.beginning_of_month.beginning_of_week(:monday)
    @tasks = @tasks.where(status: params['status']) if params['status'].present?
  end

  def show
    #fetching task from the id
    @task = Task.find(params[:id])
  end

  #displays the form to create a new task
  def new
    #creates an empty task
    @task = Task.new
  end

  #handling the form for creating a task and initialising it
  def create
    @task = Task.new(task_params)

    if @task.save
      #redirects back to 
      redirect_to @task
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  #updating the task with the data that was given
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to @task
    else
      #render with error
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    #delete teh task by the id and 
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :status)
  end
end
