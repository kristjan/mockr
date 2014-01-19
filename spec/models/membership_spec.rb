require 'spec_helper'

describe Membership do
  describe '#user' do
    it 'is required' do
      max_user_id = User.maximum(:id) || 0
      expect(Membership.create(user_id: max_user_id + 1))
        .to have(1).error_on(:user)
    end

    it 'can only be in an organization once' do
      membership = create(:membership)
      expect(Membership.create(
        user: membership.user,
        organization: membership.organization
      )).to have(1).error_on(:user_id)
    end
  end

  describe 'organization' do
    it 'is required' do
      max_organization_id = Organization.maximum(:id) || 0
      expect(Membership.create(organization_id: max_organization_id + 1))
        .to have(1).error_on(:organization)
    end
  end

  describe '#role' do
    it 'is required' do
      expect(Membership.create).to have(1).error_on(:role)
    end

    %w[administrator member].each do |role|
      it "can be #{role}" do
        expect(Membership.create(role: role)).to have(0).errors_on(:role)
      end
    end

    it 'can not be a nonexistant role' do
      expect(Membership.create(role: 'croissant')).to have(1).error_on(:role)
    end
  end

end
