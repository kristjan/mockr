require 'spec_helper'

describe 'users/show.html.haml' do
  let!(:user) { assign(:user, create(:user)) }
  let!(:mocks) do
    assign(:mocks, 2.times.map { create(:mock, creator: user) })
  end

  it 'renders their info' do
    render

    assert_select 'h1 .name', text: user.name
    assert_select 'h1 .email', html: mail_to(user.email)
  end

  it_behaves_like 'a mock list'
end
