class Form::AnswerDetail < AnswerDetail
  REGISTRABLE_ATTRIBUTES = %i(id content question_no _destroy) # AnswerDetailに項目が追加されたときはここにも追加しないといけない。
end
