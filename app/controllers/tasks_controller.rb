# frozen_string_literal: true

class TasksController < ApplicationController
  def index
    @tasks = Task.includes(:family_member)
                 .order(created_at: :desc)
                 .page(params[:page])
                 .per(params[:per])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(create_task_params)

    if @task.save
      redirect_to action: :index
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if task.update(update_task_params)
      flash[:success] = 'Task Finished!'
    else
      flash[:error] = 'Could not update task'
    end
    redirect_to action: :index
  end

  private

  def task
    @task ||= Task.find(params[:id])
  end

  def create_task_params
    params.require(:task).permit(:description, :family_member_id)
  end

  def update_task_params
    params.require(:task).permit(:status)
  end
end
