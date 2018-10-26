class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new
    cannot :manage, :all #未ログイン
    if user && user.login_type == 0         #ユーザ側の場合
      #indexの表示、編集、読み込みは禁止する。結果、createのみ可能
      can :manage, Answer, office_id: user.office.id
      cannot :index, Answer
      cannot :update, Answer
      cannot :read, Answer
      cannot :destroy, Answer

    elsif user && user.login_type == 1      #店舗管理者モードの場合
      #自店舗のデータであればmanage可能
      can :manage, Answer, office_id: user.office.id
      can :manage, Question, office_id: user.office.id


    elsif user && user.login_type == 2      #システム管理者モードの場合
      #すべてのデータであればmanage可能
      can :manage, :all
      #システム管理者画面にアクセス可能
      can :access, :rails_admin
    else

    end
  end
end
