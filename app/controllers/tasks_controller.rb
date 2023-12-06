class TasksController < ApplicationController
    before_action :set_current_user, only: [:new, :create, :review, :reviewTask, :show]
  
  
  
  
    def new
      @task = Task.new
    end
  
    def create
      @task = @current_user.tasks.build(task_params)
  
      @role = @task.assign_to
      puts "role = #{@role}"
      puts "task = #{@task}"
      puts "before save"
      if @task.save
        puts "after save"
        redirect_to allTasks_path, notice: 'Task was successfully created.'
      else
        puts "else condition"
        render :new
      end
    end
  
    def show
      @current_user
      @tasks = Task.all
    end

    def review
      @current_user
      @task = Task.find_by(params[:id])
      puts "Task = #{@task}"

      @reviews = ReviewTask.all
      puts "Review = #{@reviews}"
      puts "task = #{@task}"
      @reviewTask = ReviewTask.new(@task.attributes)
      @reviewTask.save
    end

    def reviewTask
      puts "current user in reviewTask def = #{@current_user}"

      @reviewTask = ReviewTask.new(@task.attributes)
      @reviewTask.save
    end
  
  
    private
  
    def task_params
      params.requirve(:task).permit(:title, :description, :assign_to, :status)
    end
  
    def set_current_user
      token = session[:user_token]
      puts "Session token: #{token.inspect}"
  
      if token.present?
        user_info = JsonWebToken.decode(token)
        puts "Decoded user info: #{user_info.inspect}"
  
        user_id = user_info[:email]
        if user_id.present?
          puts "user email = #{user_id}"
          @current_user = Admin.find_by(email: user_id) || Manager.find_by(email: user_id) || Employee.find_by(email: user_id)
          puts "Found user: #{@current_user.inspect}"
        else
          puts "user id inside else = #{user_id}"
          @current_user = nil
        end
      else
        @current_user = nil
      end
    end
  
  end