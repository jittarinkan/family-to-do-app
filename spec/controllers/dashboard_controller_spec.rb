# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let!(:family_members) { create_list(:family_member, 3) }

  describe 'GET #index' do
    subject { get :index }

    it 'assigns family_members' do
      subject
      expect(assigns(:family_members)).to eq family_members
    end
  end
end
