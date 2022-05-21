# frozen_string_literal: true

class FamilyMembersController < ApplicationController
  def new
    @family_member = FamilyMember.new
  end

  def create
    @family_member = FamilyMember.new(create_family_member_params)

    if @family_member.save
      redirect_to dashboard_index_path, success: 'Successfully created family member.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def create_family_member_params
    params.require(:family_member).permit(:name)
  end
end
