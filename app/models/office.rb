class Office < ApplicationRecord
  has_many :users
  has_many :answers
  has_many :questions
end
