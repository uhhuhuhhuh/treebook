require 'test_helper'

    class UserTest < ActiveSupport::TestCase
    should have_many(:user_friendships)
    should have_many(:friends)
        
 test "a user should enter their first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
    end

 test "a user should enter their last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
    end
    
     test "a user should enter their profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
    end
    
   test "a user should have unique profile name" do
    user = User.new
    user.profile_name = users(:username).profile_name
 #   user.profile_name = "newladystuff"
  #  user.first_name = "lusernew"
   # user.last_name = "lnamenew"
    #user.email = "ladies@address.com"
    #user.password = "password"
    #user.password_confirmation = "password"
    assert !user.save
    puts user.errors.inspect
    assert !user.errors[:profile_name].empty?
    end

    test "access friend list" do
        assert_nothing_raised do
            users(:username).friends
        end
    end
      
      test "create friendships" do
        users(:username).friends << users(:userthree)
        users(:username).friends.reload
        assert users(:username).friends.include?(users(:userthree))
    end
    
end
