require 'rails_helper'

RSpec.describe 'Tea Details PORO' do
  describe '::initialize' do
    it 'creates tea details object' do
      tea_hash = {:_id=>"5fa3ff13d5ba620017ec1c0d",
                  :name=>"jasmine",
                  :image=>"uploads/jasmine.png",
                  :description=>"Relieves stress and helps in weight loss.",
                  :keywords=>"fragrant, sweet, calm",
                  :origin=>"China",
                  :brew_time=>2,
                  :temperature=>80,
                  :comments=>
                  [{:date=>"Mon Nov 16 2020 05:07:11 GMT+0000 (Coordinated Universal Time)",
                    :_id=>"5fb208ffdfffc20017aea00a",
                    :text=>"This is my favourite tea! Smells good too!"},
                    {:date=>"Mon Feb 08 2021 10:46:32 GMT+0000 (Coordinated Universal Time)",
                    :_id=>"60211688f51330001749edf0",
                    :text=>"these is amazing"},
                    {:date=>"Thu May 13 2021 14:38:42 GMT+0000 (Coordinated Universal Time)",
                    :_id=>"609d39f200e7430017a94d4a",
                    :text=>"wow"}],
                  :__v=>3}

      tea = TeaDetails.new(tea_hash)
      
      expect(tea).to be_a(TeaDetails)
      expect(tea.name).to eq(tea_hash[:name])
      expect(tea.description).to eq(tea_hash[:description])
      expect(tea.brew_time).to eq(tea_hash[:brew_time])
      expect(tea.temperature).to eq(tea_hash[:temperature])      
    end
  end
end