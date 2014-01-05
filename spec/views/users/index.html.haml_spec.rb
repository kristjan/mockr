require 'spec_helper'

describe 'users/index.html.haml' do
  let!(:users) do
    assign(:users, 2.times.map { create(:user) })
  end

  it 'renders a list of users' do
    render

    users.each do |user|
      assert_select 'tr>td', html: link_to(user.name, user)
      assert_select 'tr>td', html: mail_to(user.email)
    end
  end
end
