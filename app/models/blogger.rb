class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :bio, length: { minimum: 30 }
    validates :age, numericality: { only_integer: true, greater_than: 0 }

    def total_likes
        self.posts.reduce(0){|total, post| total + post.likes}
    end

    def post_most_liked
        self.posts.max_by{|post| post.likes}
    end

    def top_5_destinations
        self.destinations.max_by(5){|destination| destination.name}.uniq
    end
end
