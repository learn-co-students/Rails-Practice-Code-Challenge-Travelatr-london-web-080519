class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_most_recent_posts
        self.posts.order("created_at DESC").limit(5)
    end

    def most_liked_post
        self.posts.max_by{|post| post.likes }
    end

    def uniq_bloggers
        self.bloggers.uniq
    end

    def av_age_of_uniq_bloggers
        self.uniq_bloggers.sum{|blogger| blogger.age } / self.uniq_bloggers.count
    end

end
