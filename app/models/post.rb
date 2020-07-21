class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    #validate :clickbait 
    
#don't understand custom methods yet but took my best shot at 10pm    
#     clickbait = ["Won't Believe","Secret","Top 1", "Top 2", "Top 3", "Top 4", "Top 5", "Top 6", "Top 7", "Top 8", "Top 9", "Top 10","Guess"]
#     def clickbait
#        if !clickbait.include?(title)
#        errors.add(:title, "this is clickbait")
#         end
#     end
end
