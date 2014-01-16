require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
    should belong_to(:user)
    should belong_to(:friend)
    
    test "that creating a friend works" do
        assert_nothing_raised do
        UserFriendship.create user: users(:username), friend: users(:usertwo)
        end    
    end
    
    test "create friendships on friend id" do
       UserFriendship.create user_id: users(:username).id, friend_id: users(:usertwo).id
        assert users(:username).friends.include?(users(:usertwo))
    end
end
