describe 'devise/registrations/new.html.haml', registration: true do

  before(:each) do
    view.stubs(:resource).returns(User.new)
    view.stubs(:resource_name).returns(:user)
    view.stubs(:devise_mapping).returns(Devise.mappings[:user])
    render
  end

  describe 'fields' do
    it 'requests a name' do
      assert_select 'form input[type=text][name=?]', "user[name]"
    end

    it 'requests an email' do
      assert_select 'form input[type=email][name=?]', "user[email]"
    end

    it 'requests a password' do
      assert_select('form input[type=password][name=?]', 'user[password]')
    end

    it 'requests a password confirmation' do
      assert_select(
        'form input[type=password][name=?]',
        'user[password_confirmation]'
      )
    end
  end

end
