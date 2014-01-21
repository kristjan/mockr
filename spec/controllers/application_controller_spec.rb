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
  end

  context 'organizations' do
    let(:user) { create(:unaffiliated_user) }

    before(:each) do
      sign_in(user)
    end

    context 'when the user does not belong to any organizations' do
      it 'redirects to create one' do
        get :index
        expect(response).to redirect_to(new_organization_path)
      end
    end

    context 'when the user belongs to an organization' do
      let(:user) { create(:user) }

      it 'allows the request' do
        get :index
        expect(response).to be_success
      end
    end
  end

end
