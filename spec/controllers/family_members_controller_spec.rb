# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FamilyMembersController, type: :controller do
  describe 'POST #create' do
    subject { post :create, params: params }

    let(:params) do
      {
        family_member: { name: Faker::Name.first_name }
      }
    end

    context 'with correct params' do
      it 'creates a family member' do
        expect { subject }.to change { FamilyMember.count }.by 1
      end

      it 'redirects to index' do
        subject
        expect(response).to redirect_to dashboard_index_path
      end

      it 'flashes success messages' do
        subject
        expect(flash[:success]).to match(/Successfully created family member./)
      end
    end

    context 'with missing params' do
      let(:params) do
        {
          family_member: { name: '' }
        }
      end

      it 'does not create a new family member' do
        expect { subject }.not_to change { FamilyMember.count }
      end

      it 'renders new' do
        subject
        expect(subject).to render_template('new')
      end
    end
  end
end