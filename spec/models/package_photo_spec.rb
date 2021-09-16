require 'rails_helper'

RSpec.describe PackagePhoto, type: :model do
  describe 'relationships' do
    it { should belong_to(:subscription) }
    it { should belong_to(:photo) }
  end
end
