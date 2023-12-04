class DashboardController < ApplicationController
  def show
    @tasks = Task.all
  end

  def create
  
    @task = @current_user.tasks.build(task_params)

    @role = @task.assign_to
    puts "role = #{@role}"
    puts "task = #{@task}"
    if @task.save
      redirect_to dashboard_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def show
    @tasks = Task.all
  end
end
