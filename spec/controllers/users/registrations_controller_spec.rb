describe Users::RegistrationsController do
  before(:each) do
    @request.env['devise.mapping'] = Devise.mappings[:user]
  end

  describe '#create' do
    let(:params) do
      { user: user_params }
    end
    let(:valid_user_params) do
      password = Faker::Lorem.words(3).join
      {
        name:                  Faker::Name.name,
        email:                 Faker::Internet.email,
        password:              password,
        password_confirmation: password
      }
    end

    context 'with valid user params' do
      let(:user_params) { valid_user_params }

      it 'creates a new user' do
        expect {
          post :create, params
        }.to change(User, :count).by(1)
      end

      it 'redirects to the homepage' do
        post :create, params
        expect(response).to redirect_to(root_path)
      end
    end

    %i[name email password password_confirmation].each do |required|
      context "with a missing #{required}" do
        let(:user_params) do
          valid_user_params.tap { |params| params[required] = '' }
        end

        it 'does not create a new user' do
          expect {
            post :create, params
          }.to_not change(User, :count)
        end

        it 're-renders the signup page' do
          post :create, params
          expect(response).to render_template('devise/registrations/new')
        end
      end
    end
  end
end
