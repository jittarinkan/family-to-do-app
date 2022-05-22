# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FamilyMembers::TasksController, type: :controller do
  describe 'GET #index' do
    subject { get :index, params: params }

    let!(:family_member) { create :family_member }
    let!(:tasks) { create_list(:task, 5, family_member: family_member) }
    let(:params) { { family_member_id: family_member.id } }

    it 'assigns tasks' do
      subject
      expect(assigns(:tasks)).to eq tasks.reverse
    end

    it 'sorts by created_at desc' do
      subject
      expect(assigns(:tasks)).to eq tasks.reverse
    end
  end

  describe 'GET #new' do
    subject { get :new, params: params }

    let(:params) { { family_member_id: family_member.id } }
    let!(:family_member) { create :family_member }

    it 'assigns task' do
      subject
      expect(assigns(:task)).to be_present
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { family_member_id: family_member.id, task: params } }

    let(:family_member) { create :family_member }
    let(:params) { { description: 'chore number 99', family_member_id: family_member.id } }

    context 'with correct params' do
      it 'creates task' do
        expect { subject }.to change { Task.count }.by 1
      end

      it 'creates task for that family member' do
        expect { subject }.to change { family_member.tasks.count }.by 1
      end

      it 'redirects to index' do
        subject
        expect(response).to redirect_to action: :index
      end
    end

    context 'with missing params' do
      let(:params) { { name: '' } }

      it 'does not change task count' do
        expect { subject }.not_to change { Task.count }
      end

      it 'renders new' do
        subject
        expect(response).to render_template :new
      end
    end
  end

  describe 'PUT #update' do
    subject { put :update, params: { family_member_id: family_member.id, id: task.id, task: params } }

    let(:task) { create :task }
    let(:family_member) { create :family_member }
    let(:params) { { status: :complete } }

    it 'updates status to complete' do
      expect { subject }.to change { task.reload.status }.to('complete')
    end

    it 'redirects to index' do
      subject
      expect(response).to redirect_to family_member_tasks_path
    end
  end
end