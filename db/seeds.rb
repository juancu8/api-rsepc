# Set users
user_1 = FactoryBot.create(:user)
user_2 = FactoryBot.create(:user)

FactoryBot.create_list(:post, 5, user: user_1)
FactoryBot.create_list(:post, 5, user: user_2)