# frozen_string_literal: true

class FamilyMembers::TasksController < TasksController
  def index
    @tasks = family_member.tasks
                          .order(created_at: :desc)
                          .page(params[:page])
                          .per(params[:per])
  end

  def update
    if task.update(update_task_params)
      flash[:success] = 'Task Finished!'
    else
      flash[:error] = 'Could not update task'
    end
    binding.pry
    redirect_to family_member_tasks_path
  end

  private

  def family_member
    @family_member ||= FamilyMember.find(params[:family_member_id])
  end
end
