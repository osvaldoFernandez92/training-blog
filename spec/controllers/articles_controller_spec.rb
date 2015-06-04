require 'rails_helper'

describe ArticlesController do
  describe 'GET index' do
    let(:user) { FactoryGirl.create(:user) }
    context 'when logged in' do
      before do
        sign_in user
        get :index
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to render_with_layout :application }
      it { is_expected.to render_template :index }
    end
    #    context 'when NOT logged in' do
    #      before do
    #        get :index
    #      end
    #      it { is_expected.to redirect_to new_user_session_path(locale: :en) }
    #	   end
  end
  describe 'GET show/:id' do
    let(:user) { FactoryGirl.create(:user) }
    let(:article) { FactoryGirl.create(:article) }
    context 'when logged in' do
      before do
        sign_in user
        get :show, id: article.id
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :show }
    end
  end

  describe 'GET new' do
    let(:user) { FactoryGirl.create(:user) }
    context 'when logged in' do
      before do
        sign_in user
        get :new
      end
      it { is_expected.to respond_with :ok }
      it { is_expected.to render_template :new }
    end
  end
end
