require 'spec_helper'

describe "organizations/index" do
  let(:organizations) do
    2.times.map { create(:organization) }
  end

  before(:each) do
    assign(:organizations, organizations)
  end

  it "renders a list of organizations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers

    organizations.each do |organization|
      assert_select "tr>td", :text => organization.name
    end
  end
end
