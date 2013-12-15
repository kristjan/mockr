require 'spec_helper'

describe "mocks/show" do
  before(:each) do
    @mock = assign(:mock, stub_model(Mock,
      :creator_id => 1,
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Url/)
  end
end
