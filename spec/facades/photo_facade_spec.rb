require 'rails_helper'

describe PhotoFacade, :vcr do 
  describe "class methods" do
    context '::get_photos' do
      it 'happy path: gets photos and creates Photo Poros' do
        photos = PhotoFacade.get_photos("puppy")

        expect(photos.first).to be_a(PhotoDetails)
        expect(photos.count).to eq(10)
      end
    end
  end
end