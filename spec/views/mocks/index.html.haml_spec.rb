require 'spec_helper'

describe "mocks/index" do
  let!(:mocks) do
    assign(:mocks, 2.times.map { create(:mock) })
  end

  it "renders a list of mocks" do
    render

    mocks.each do |mock|
      assert_select "tr>td", :text => mock.creator_id.to_s
      assert_select "tr>td", :text => mock.image.url
    end
  end
end
