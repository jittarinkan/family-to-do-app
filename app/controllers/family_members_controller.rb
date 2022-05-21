class FamilyMembersController < ApplicationController
  before_action :set_family_member, only: %i[ show ]

  def index
    @family_members = FamilyMember.all
  end

  def new
    @family_member = FamilyMember.new
  end

  def create
    @family_member = FamilyMember.new(create_family_member_params)

    if @family_member.save
      redirect_to @family_member, notice: "Family member was successfully created."
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
