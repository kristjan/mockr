require 'spec_helper'

describe 'users/show.html.haml' do
  let!(:user) { assign(:user, create(:user)) }

  it 'renders their info' do
    render

    assert_select 'h1 .name', text: user.name
    assert_select 'h1 .email', html: mail_to(user.email)
  end

  context 'their mocks' do
    let!(:mocks) do
      assign(:mocks, 2.times.map { create(:mock, creator: user) })
    end

    it 'links to them' do
      render

      mocks.each do |mock|
        assert_select 'a[href=?]', mock_path(mock)
      end
    end

    it 'shows their image' do
      render

      mocks.each do |mock|
        assert_select 'a img[src=?]', mock.image
      end
    end
  end
end
