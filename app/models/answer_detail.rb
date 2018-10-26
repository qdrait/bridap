class AnswerDetail < ActiveRecord::Base  #ApplicationRecord
  belongs_to :answer
  default_scope { order(:id) }
end
