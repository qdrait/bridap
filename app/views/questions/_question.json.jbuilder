json.extract! question, :id, :office_id, :title, :input_type, :choices, :order, :required, :display, :created_at, :updated_at
json.url question_url(question, format: :json)
