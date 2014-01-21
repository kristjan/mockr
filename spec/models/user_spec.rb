require 'spec_helper'

describe User do
  subject(:user) { create(:user) }

  it "has a valid factory" do
    create(:user).should be_valid
  end

  it "is not valid with a blank name" do
    build(:user, name: "").should_not be_valid
  end

  describe '#admin?' do
    let(:organization) { create(:organization) }

    context 'when the user is not a member' do
      it 'is false' do
        expect(user).to_not be_admin(organization)
      end
    end

    context 'when the user is a member' do
      before(:each) { user.join!(organization) }

      it 'is false' do
        expect(user).to_not be_admin(organization)
      end
    end

    context 'when the user is an admin' do
      before(:each) { user.join!(organization, true) }

      it 'is true' do
        expect(user).to be_admin(organization)
      end
    end
  end

  describe '#join!' do
    let(:organization) { create(:organization) }

    context 'when the user is not a member' do

      it 'makes the user a member of the organization' do
        expect {
          user.join!(organization)
          user.reload
        }.to change {
          user.member?(organization)
        }.from(false).to(true)
      end

      it 'defaults to normal membership' do
        user.join!(organization)
        expect(user).to be_member(organization)
      end

      it 'can make the user an admin' do
        user.join!(organization, true)
        expect(user).to be_admin(organization)
      end
    end

    context 'when the user is a member' do
      before(:each) { user.join!(organization) }

      it 'leaves the user a member' do
        user.join!(organization)
        expect(user).to be_member(organization)
      end

      it 'can promote the user to administrator' do
        user.join!(organization, true)
        expect(user).to be_admin(organization)
      end
    end

    context 'when the user is an admin' do
      before(:each) { user.join!(organization, true) }

      it 'leaves the user an admin' do
        user.join!(organization)
        expect(user).to be_admin(organization)
      end
    end
  end

  describe '#member?' do
    let(:organization) { create(:organization) }

    context 'when the user is not a member' do
      it 'is false' do
        expect(user).to_not be_member(organization)
      end
    end

    context 'when the user is a member' do
      before(:each) { user.join!(organization) }

      it 'is true' do
        expect(user).to be_member(organization)
      end
    end

    context 'when the user is an admin' do
      before(:each) { user.join!(organization, true) }

      it 'is true' do
        expect(user).to be_member(organization)
      end
    end
  end
end
