class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction), message: "%{value} is not a valid category" }
    validate :is_click_bait?

    CLICKBAIT_TITLES = [
        /Won't Believe/,
        /Secret/,
        /Top [0-9]/,
        /Guess/
    ]

    def is_click_bait?
        errors.add(:title, "Error Message: Not Clickbait") if CLICKBAIT_TITLES.none? {|r| r.match(self.title) }
    end
end
