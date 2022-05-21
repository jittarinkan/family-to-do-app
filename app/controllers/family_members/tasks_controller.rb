# frozen_string_literal: true

class FamilyMembers::TasksController < TasksController
  def index
    @tasks = family_member.tasks
                          .order(created_at: :desc)
                          .page(params[:page])
                          .per(params[:per])
  end

  private

  def family_member
    @family_member ||= FamilyMember.find(params[:family_member_id])
  end
end
