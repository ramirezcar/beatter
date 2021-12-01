class ProfilesController < ApplicationController
    # before_action :authenticate_user!, only: [:show, :index]

    def follow_action
        if signed_in?
            @me = current_user.id
            @other = params[:id]
            Follow.create(follower_id: @me, followed_id: @other)
            redirect_back(fallback_location: "/")
        else
            redirect_to new_user_session_path
        end
    end

    def unfollow_action
        me = current_user.id
        other = params[:id]
        follow = Follow.destroy(Follow.get_follow(me, other).id)
        redirect_back(fallback_location: "/")
    end

    def get_posts
        posts = signed_in? ? Post.where(user_id: params[:id]) : Post.where(user_id: params[:id])#[]
    end
    
    def get_tracks
        tracks = signed_in? ? Track.where(user_id: params[:id]) : []
    end

    def get_feed
        feed = []

        # Obteniendo cada lista por separado
        get_posts.each do |post|
            # almacenando cada registro en una lista para mezclar
            feed.push(post)
        end

        get_tracks.each do |track|
            # almacenando cada registro en una lista para mezclar
            feed.push(track)
        end
        return feed
    end

    def show
        @user = User.find(params[:id])
        @is_current = (@user == current_user ? true : false)
        @is_followed = Follow.is_followed(current_user, @user)
        @feed  = get_feed.sort_by(&:created_at).reverse!
        @followers_count = User.get_followers_count(@user)
        @followed_count = User.get_followed_count(@user)
    end
    
    def followers
        @user = params[:id]
        @follows = Follow.get_user_followers(@user)
        @users = []
        @follows.each do |follow|
            @users.push(User.find(follow.follower_id))
        end

        render "follows"
    end

    def followed
        @follows = Follow.get_user_followed(params[:id])
        @users = []
        @follows.each do |follow|
            @users.push(User.find(follow.followed_id))
        end

        render "followers", title: "yes"
    end

    def search
        if params[:search].blank?
            redirect_to profiles_path and return
        else
            @parameter = params[:search].downcase
            @results = User.all.where("lower(aka) like :search", search: "%#{@parameter}%")
        end
    end

end