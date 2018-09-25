class AnswerDetail < ActiveRecord::Base  #ApplicationRecord
  belongs_to :answer

  default_scope { order(:question_no) }
end
