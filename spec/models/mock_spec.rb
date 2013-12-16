require 'spec_helper'

describe Mock do
  context 'with no parameters' do
    it { should have(1).error_on(:creator) }
    it { should have(1).error_on(:image) }
  end
end
