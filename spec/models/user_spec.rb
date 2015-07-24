require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create :user }
  it { should validate_presence_of :email }
  it { should validate_presence_of :name }
  it { should have_many :tasks }
end
