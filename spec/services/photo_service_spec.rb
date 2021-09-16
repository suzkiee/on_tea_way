require 'rails_helper'

RSpec.describe PhotoService do
  describe '::search_photos' do
    it 'connects to Unsplash API' do 
      response = PhotoService.search_photos("puppy")
      
      expect(response).to be_a(Hash)
      expect(response).to have_key(:total)
      expect(response).to have_key(:total_pages)
      expect(response).to have_key(:results)
    end
  end
end