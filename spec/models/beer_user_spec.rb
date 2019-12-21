require 'spec_helper'

describe BeerUser do
	it { should validate_uniqueness_of(:beer_id).scoped_to(:user_id).with_message('Already seen') }
	it { should validate_uniqueness_of(:favorite).scoped_to(:user_id).with_message('Already have a favorite') }
  it 'Associations' do
    expect(subject).to belong_to(:user)
    expect(subject).to belong_to(:beer)
  end
end
