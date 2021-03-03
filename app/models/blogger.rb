class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts
    validates :name, uniqueness: true
    validates :bio, length: {minimum: 31}


    def total_likes
        if self.posts.empty?
            0
        else
            self.posts.sum{|post| 
                if post.likes
                     post.likes
                else
                    0
                end
            }
        end 
    end

    def featured_post
            self.posts.max_by{|post| post.likes }
    end

    def top_five_destinations
        self.destinations.group(:name).order('COUNT(name) DESC').limit(5)
    end
end
