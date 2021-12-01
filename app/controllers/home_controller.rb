class HomeController < ApplicationController 

    def get_posts
        posts = signed_in? ? Post.feed(current_user.id) : []
    end
    
    def get_tracks
        tracks = signed_in? ? Track.feed(current_user.id) : []
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
    
    def index
        if signed_in?
            @trending = get_tracks.sort_by(&:created_at).reverse!
            # TODO: hacer logica de los tracks globales mas likeados/escuchados
            @feed  = get_feed.sort_by(&:created_at).reverse!
        else
            redirect_to new_user_session_path#, notice: 'You are not logged in.'
        end
        # @feed.each do |f|
        #     puts f.id.to_s + " -> " + f.user.aka + " -> " + f.created_at.to_s
        #     puts f.class.name
        # end
    end
end
