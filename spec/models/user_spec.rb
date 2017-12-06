require "rails_helper"

describe User do
  it { should have_one :account }
  it { should have_many :reviews }

  it 'will have an admin value of false when created' do
    user = FactoryBot.create(:user)
    expect(user.admin).to eq false
  end
end
