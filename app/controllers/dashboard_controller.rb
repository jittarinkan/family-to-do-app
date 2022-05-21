# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @family_members = FamilyMember.all
                                  .page(params[:page])
                                  .per(params[:per])
  end
end
