require 'spec_helper'

describe Comment do
  context 'with no parameters' do
    it { should have(1).error_on(:author) }
    it { should have(1).error_on(:mock) }
    it { should have(1).error_on(:body) }
  end
end
