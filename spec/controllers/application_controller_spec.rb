describe ApplicationController do
  controller do
    def index
      render text: 'OK'
    end
  end

  context 'authentication' do
    context 'when the user is not logged in' do
      it 'redirects to signin' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when the user is logged in' do
      before(:each) { sign_in(create(:user)) }

      it 'allows access' do
        get :index
        expect(response).to be_success
      end
    end
  end

end
