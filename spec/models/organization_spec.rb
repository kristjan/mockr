require 'spec_helper'

describe Organization do
  context 'validations' do
    it 'requires a name' do
      expect(Organization.create).to have(1).error_on(:name)
      expect(Organization.create(name: '')).to have(1).error_on(:name)
      expect(Organization.create(name: ' ')).to have(1).error_on(:name)
    end
  end
end
