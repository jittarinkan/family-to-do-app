# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    let!(:family_member) { create :family_member }

    let!(:task1) { create_list :task, 5, family_member: family_member }

    it 'assigns tasks' do
      subject
      expect(assigns(:tasks)).to eq [task2, task1]
    end

    it 'sorts by created_at desc' do
      subject
      expect(assigns(:tasks)).to eq [task2, task1]
    end
  end

  describe 'GET #new' do
    subject { get :new }

    it 'assigns task' do
      subject
      expect(assigns(:task)).to be_present
    end
  end

  describe 'POST #create' do
    subject { post :create, params: { task: params } }

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

      it 'flashes correct message' do
        subject
        expect(flash[:success]).to match(/Successfully created task./)
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
    subject { put :update, params: { id: task.id, task: params } }

    let(:task) { create :task }
    let(:params) { { status: :complete } }

    it 'updates status to complete' do
      expect { subject }.to change { task.reload.status }.to('complete')
    end

    it 'redirects to index' do
      subject
      expect(response).to redirect_to action: :index
    end
  end
end