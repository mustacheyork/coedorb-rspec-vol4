require 'rails_helper'

RSpec.describe User, :type => :model do
  it "isn't valid without name" do
    user = User.new
    user.name = nil
    expect(user).not_to be_valid
  end
end
