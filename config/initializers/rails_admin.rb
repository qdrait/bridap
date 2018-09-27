RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.excluded_models = ["Form::Answer","Form::AnswerDetail",]

  config.model 'Answer' do
    LABEL_id = '回答ID'
    LABEL_user = 'ユーザ'
    LABEL_office = '店舗'
    LABEL_answer_details = '回答詳細'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'

    list do
      field :id do
        label LABEL_id
      end
      field :user do
        label LABEL_user
      end
      field :office do
        label LABEL_office
      end
      field :answer_details do
        label LABEL_answer_details
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end


  config.model 'AnswerDetail' do
    LABEL_id = '回答詳細ID'
    LABEL_answer = '回答'
    LABEL_question_no = '設問NO'
    LABEL_content = '回答内容'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'

    list do
      field :id do
        label LABEL_id
      end
      field :answer do
        label LABEL_answer
      end
      field :question_no do
        label LABEL_question_no
      end
      field :content do
        label LABEL_content
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end


  def custom_label_method
    self.email
  end

  config.model 'User' do
    LABEL_id = 'ユーザID'
    LABEL_email = 'メールアドレス'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'

    object_label_method do
      :custom_label_method
    end

    list do
      field :id do
        label LABEL_id
      end
      field :email do
        label LABEL_email
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end

  config.model 'Office' do
    LABEL_id = '店舗ID'
    LABEL_name = '店舗名'
    LABEL_message = '店舗メッセージ'
    LABEL_created_at = '作成日時'
    LABEL_updated_at = '更新日時'

    list do
      field :id do
        label LABEL_id
      end
      field :name do
        label LABEL_name
      end
      field :message do
        label LABEL_message
      end
      field :created_at do
        label LABEL_created_at
      end
      field :updated_at do
        label LABEL_updated_at
      end
    end
  end

end
