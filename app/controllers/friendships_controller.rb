class FriendshipsController < ApplicationController

    def destroy
        @friend = User.find(params[:id])
        @friendship = current_user.friendships.where(friend_id: params[:id]).first
        @friendship.destroy
        flash[:notice] = "#{@friend.full_name} is removed from your friend list"
        redirect_to my_friends_path
    end
end