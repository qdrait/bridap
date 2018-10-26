class Question < ApplicationRecord
  belongs_to :office
  default_scope { order(:office_id, :order) }
end
