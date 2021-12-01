# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_and_follow
    start = 0
    ends = 18

    while start < ends  do
        randm_name = (0...4).map { ('a'..'z').to_a[rand(12)] }.join
        user = User.create(email: randm_name+"31125@mail.cl",password: '123456', aka: randm_name, desc: "Hola, me conocen como "+randm_name)
        follow = follow(user.id)
        puts "El usuario id -> " + user.id.to_s + " sigue ahora a " + User.find(follow.followed_id).aka
        
        start += 1
    end
end

def follow(one, two)
    follow = Follow.create(follower_id: one, followed_id: two)
    puts "El nuevo usuario id -> " + one.to_s + " sigue ahora a " + User.find(follow.followed_id).aka
end
 
def random_follows(who = nil)
    start = 0
    ends = 18
    followed = who ? who : rand(4..6)
    randm_users = rand(7..User.last.id)

    while start < ends  do
        follow = follow(rand(4..6), followed)
    start += 1
    end
end

random_follows(6)