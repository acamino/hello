module Hello
  class ImpersonateEntity < AbstractEntity
    def initialize(user)
      @user = user
    end

    def success_message(_extra = {})
      super(name: @user.name)
    end
  end
end
