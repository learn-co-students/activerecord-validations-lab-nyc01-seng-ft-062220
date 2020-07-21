class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :title_is_sufficiently_clickbait
    
    def title_is_sufficiently_clickbait
        if self.title
            reqs = ["Won't Believe", "Secret", "Top[number]", "Guess"]
            if reqs.detect {|el| self.title.include?(el) }.nil?
              self.errors[:title] << "Must contain clickbait"
            end
          
        end
    end

end