describe Devise::SessionsController do
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe 'GET #new' do
    it 'renders the signin page' do
      get :new
      expect(response).to render_template(:new)
    end
  end
end
