FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published {
      r = rand(0..1)
      r == 0 ? true : false
    }
    # This reference will be create a new factory user for this post
    user
  end

  factory :published_post, class: 'Post' do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    published { true }
    # This reference will be create a new factory user for this post
    user
  end
end
