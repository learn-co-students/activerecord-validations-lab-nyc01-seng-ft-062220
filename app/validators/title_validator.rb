# class TitleValidator < ActiveModel::Validator
#     def validate(record)
#         unless record.title.include?(/Won't Believe|Secret|Top [0-9]*|Guess/)
#           record.errors[:title] << "Make it clickbait!"
#         end
#     end
# end


class TitleValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /Won't Believe|Secret|Top [0-9]*|Guess/
      record.errors[attribute] << "Make it clickbait!"
    end
  end
end