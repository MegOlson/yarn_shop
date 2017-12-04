require "rails_helper"

describe User do
  it { should have_one :account }
  it { should have_many :reviews }
end
