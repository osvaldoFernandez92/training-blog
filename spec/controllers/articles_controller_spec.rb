require "rails_helper"

describe ArticlesController do
  describe "GET index" do
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
end 

