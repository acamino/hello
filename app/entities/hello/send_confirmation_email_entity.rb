module Hello
  class SendConfirmationEmailEntity < AbstractEntity
    attr_reader :controller, :email_credential

    def initialize(controller, email_credential)
      @controller = controller
      @email_credential = email_credential
    end

    def deliver
      token = email_credential.reset_verifying_token!
      check_token!(token)
      url   = controller.confirm_email_url(email_credential, token)
      mail  = Hello::RegistrationMailer.confirm_email(email_credential, url)
      mail.deliver
    end

    def success_message(_extra = {})
      super(email: email_credential.email)
    end

    private

    def check_token!(unencrypted_token)
      fail 'no match' unless email_credential.verifying_token_is?(unencrypted_token)
    end
  end
end
