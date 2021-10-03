require 'rails_helper'

RSpec.describe TeaService do
  describe '::find_tes' do
    it 'connects to Tea API', :vcr do
      response = TeaService.find_tea("jasmine")
     
      expect(response).to be_a(Hash)
      expect(response).to have_key(:_id)
      expect(response).to have_key(:name)
      expect(response).to have_key(:image)
      expect(response).to have_key(:description)
      expect(response).to have_key(:keywords)
      expect(response).to have_key(:origin)
      expect(response).to have_key(:brew_time)
      expect(response).to have_key(:temperature)
      expect(response).to have_key(:comments)
      expect(response).to have_key(:__v)
      
      expect(response[:comments][0]).to have_key(:date)
      expect(response[:comments][0]).to have_key(:_id)
      expect(response[:comments][0]).to have_key(:text)
    end

    it 'sad path: connects to Tea API but cannot find tea from query' do
      response = TeaService.find_tea("puppy")

      expect(response).to be_a(String)
      expect(response).to eq("Cannot find the puppy tea...")
    end
  end
end
