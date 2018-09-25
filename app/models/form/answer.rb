class Form::Answer < Answer
  REGISTRABLE_ATTRIBUTES = %i(user_id office_id) # Answerに項目が追加されたときはここにも追加しないといけない。
  has_many :answer_details ,class_name: 'Form::AnswerDetail'
  after_initialize { answer_details.build unless self.persisted? || answer_details.present? }
end
