User.destroy_all
Photo.destroy_all

user = User.create!(first_name: Faker::Name.first_name, 
                    last_name: Faker::Name.last_name, 
                    email: Faker::Internet.email, 
                    address: Faker::Address.full_address, 
                    password_digest: Faker::Lorem.sentence )

user_uploaded_1 = user.photos.create!(url: Faker::Internet.url, 
                                      unsplash_id: nil,
                                      user_uploaded: true, 
                                      user_photo_url: 'spec/fixtures/files/green-blue-pink.jpeg',
                                      user: user)
user_uploaded_1.upload.attach(io: File.open('spec/fixtures/files/green-blue-pink.jpeg'), filename:'green-blue-pink.jpeg')

user_uploaded_2 = user.photos.create!(url: Faker::Internet.url, 
                                      unsplash_id: nil,
                                      user_uploaded: true, 
                                      user_photo_url: 'spec/fixtures/files/moomin.jpeg',
                                      user: user)
user_uploaded_2.upload.attach(io: File.open('spec/fixtures/files/moomin.jpeg'), filename:'moomin.jpeg')

user_uploaded_3 = user.photos.create!(url: Faker::Internet.url, 
                                      unsplash_id: nil,
                                      user_uploaded: true, 
                                      user_photo_url: 'spec/fixtures/files/start-your-morning.jpeg',
                                      user: user)
user_uploaded_3.upload.attach(io: File.open('spec/fixtures/files/start-your-morning.jpeg'), filename:'start-your-morning.jpeg')

unsplash_uploaded = user.photos.create!(url: Faker::Internet.url, 
                                        unsplash_id: "atOlntWcO4k",
                                        user_uploaded: false, 
                                        user_photo_url: "https://images.unsplash.com/photo-1600804340584-c7db2eacf0bf?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwyfHxwdXBweXxlbnwwfHx8fDE2MzIxNDM2MzY&ixlib=rb-1.2.1&q=80&w=1080",
                                        user: user)

unsplash_uploaded_2 = user.photos.create!(url: Faker::Internet.url, 
                                          unsplash_id: "fk4tiMlDFF0",
                                          user_uploaded: false, 
                                          user_photo_url: "https://images.unsplash.com/photo-1546527868-ccb7ee7dfa6a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwzfHxwdXBweXxlbnwwfHx8fDE2MzIxNDM2MzY&ixlib=rb-1.2.1&q=80&w=1080",
                                        user: user)
