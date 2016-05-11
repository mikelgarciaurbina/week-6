class TasksController < ApplicationController
  before_action :user_is_owner?, only: [:edit, :update, :destroy]
  # GET /tasks
  def index
    @tasks = current_user.tasks.all
  end

  # GET /tasks/1
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :due_date, :completed, :user_id)
    end

    def user_is_owner?
      @task = Task.find(params[:id])
      unless @task.user_id == current_user.id
        respond_to do |format|
          format.html { redirect_to tasks_url, notice: 'Task is not created for you.' }
        end
      end
    end
end
