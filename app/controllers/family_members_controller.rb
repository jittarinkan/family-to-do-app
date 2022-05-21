# frozen_string_literal: true

class FamilyMembersController < ApplicationController
  before_action :set_family_member, only: %i[ show ]

  def index
    @family_members = FamilyMember.all
                                  .page(params[:page])
                                  .per(params[:per])
  end

  def new
    @family_member = FamilyMember.new
  end

  def create
    @family_member = FamilyMember.new(create_family_member_params)

    if @family_member.save
      redirect_to family_members_path, success: "Successfully created family member."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def set_family_member
      @family_member = FamilyMember.find(params[:id])
    end

    def create_family_member_params
      params.require(:family_member).permit(:name)
    end
end
