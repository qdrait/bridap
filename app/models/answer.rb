class Answer < ActiveRecord::Base   # ApplicationRecord
  belongs_to :user
  belongs_to :office
  has_many :answer_details, dependent: :destroy
  accepts_nested_attributes_for :answer_details, allow_destroy: true

end
