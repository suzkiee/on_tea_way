require 'rails_helper'

RSpec.describe 'Photo Details PORO' do
  describe '::initialize' do
    it 'creates photo details object' do
      photo_hash = {
                    :id=>"sVtcRzphxbk",
                    :created_at=>"2020-06-25T21:17:45-04:00",
                    :updated_at=>"2021-09-15T23:17:14-04:00",
                    :promoted_at=>nil,
                    :width=>2448,
                    :height=>3264,
                    :color=>"#d9c0a6",
                    :blur_hash=>"LTJ896~Xs.IU~8IUt5oeV=IpWZtR",
                    :description=>"What a cute puppy picture",
                    :alt_description=>"white and brown short coated puppy on green grass field",
                    :urls=>
                    {:raw=>
                      "https://images.unsplash.com/photo-1593134257782-e89567b7718a?ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwxfHxwdXBweXxlbnwwfHx8fDE2MzE4MjM1MTE&ixlib=rb-1.2.1",
                      :full=>
                      "https://images.unsplash.com/photo-1593134257782-e89567b7718a?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwxfHxwdXBweXxlbnwwfHx8fDE2MzE4MjM1MTE&ixlib=rb-1.2.1&q=85",
                      :regular=>
                      "https://images.unsplash.com/photo-1593134257782-e89567b7718a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwxfHxwdXBweXxlbnwwfHx8fDE2MzE4MjM1MTE&ixlib=rb-1.2.1&q=80&w=1080",
                      :small=>
                      "https://images.unsplash.com/photo-1593134257782-e89567b7718a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwxfHxwdXBweXxlbnwwfHx8fDE2MzE4MjM1MTE&ixlib=rb-1.2.1&q=80&w=400",
                      :thumb=>
                      "https://images.unsplash.com/photo-1593134257782-e89567b7718a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwxfHxwdXBweXxlbnwwfHx8fDE2MzE4MjM1MTE&ixlib=rb-1.2.1&q=80&w=200"},
                    :links=>
                    {:self=>"https://api.unsplash.com/photos/sVtcRzphxbk",
                      :html=>"https://unsplash.com/photos/sVtcRzphxbk",
                      :download=>"https://unsplash.com/photos/sVtcRzphxbk/download",
                      :download_location=>
                      "https://api.unsplash.com/photos/sVtcRzphxbk/download?ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwxfHxwdXBweXxlbnwwfHx8fDE2MzE4MjM1MTE"},
                    :categories=>[],
                    :likes=>122,
                    :liked_by_user=>false,
                    :current_user_collections=>[],
                    :sponsorship=>nil,
                    :topic_submissions=>{},
                    :user=>
                    {:id=>"Au0ZaLIV7eQ",
                      :updated_at=>"2021-09-15T08:05:18-04:00",
                      :username=>"mancity17",
                      :name=>"David Clarke",
                      :first_name=>"David",
                      :last_name=>"Clarke",
                      :twitter_username=>nil,
                      :portfolio_url=>nil,
                      :bio=>"Love Football, Outdoors, and Travel",
                      :location=>"Denver Colorado",
                      :links=>
                      {:self=>"https://api.unsplash.com/users/mancity17",
                        :html=>"https://unsplash.com/@mancity17",
                        :photos=>"https://api.unsplash.com/users/mancity17/photos",
                        :likes=>"https://api.unsplash.com/users/mancity17/likes",
                        :portfolio=>"https://api.unsplash.com/users/mancity17/portfolio",
                        :following=>"https://api.unsplash.com/users/mancity17/following",
                        :followers=>"https://api.unsplash.com/users/mancity17/followers"},
                      :profile_image=>
                      {:small=>
                        "https://images.unsplash.com/profile-1592334481567-ffb37f8836d4image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                        :medium=>
                        "https://images.unsplash.com/profile-1592334481567-ffb37f8836d4image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64",
                        :large=>
                        "https://images.unsplash.com/profile-1592334481567-ffb37f8836d4image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128"},
                      :instagram_username=>"cimarronsteamboat",
                      :total_collections=>7,
                      :total_likes=>27,
                      :total_photos=>76,
                      :accepted_tos=>true,
                      :for_hire=>false,
                      :social=>
                      {:instagram_username=>"cimarronsteamboat", :portfolio_url=>nil, :twitter_username=>nil, :paypal_email=>nil}},
                    :tags=>[{:type=>"search", :title=>"tempe"}, {:type=>"search", :title=>"az"}, {:type=>"search", :title=>"usa"}]
                  }
      
      photo = PhotoDetails.new(photo_hash)
      
      expect(photo).to be_a(PhotoDetails)
      expect(photo.unsplash_id).to eq(photo_hash[:id])
      expect(photo.unsplash_id).to eq(photo_hash[:urls][:regular])
      expect(photo.user_uploaded).to eq(false)
    end
  end
end