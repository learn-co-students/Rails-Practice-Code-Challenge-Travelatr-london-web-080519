class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def top_5_recent_posts
        self.posts.max_by(5){|post| post.created_at}
    end

    def featured_post
        self.posts.max_by{|post| post.likes}
    end

    def unique_bloggers
        self.bloggers.uniq
    end

    def average_blogger_age
        self.unique_bloggers.reduce(0){|sum, blogger| sum + blogger.age}.to_f/unique_bloggers.size
    end
end
