require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should have_many(:package_photos) }
  end
end
