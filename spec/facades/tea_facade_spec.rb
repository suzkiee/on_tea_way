require 'rails_helper'

describe TeaFacade, :vcr do 
  describe "class methods" do
    context '::get_one_tea' do
      it 'happy path: gets tea and creates Tea Poros' do
        tea = TeaFacade.get_one_tea("jasmine")
  
        expect(tea).to be_a(TeaDetails)
      end
    end
  end
end