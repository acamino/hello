Hello.config.sign_up.config do
  
  # fields :email, :password
  fields :name, :email, :username, :password

  # controller scope
  set :success do
    #@credential
    # user = @credential.user



    # SignUpMailer.welcome(@credential).deliver
    # SignUpMailer.confirmation(@credential).deliver



    respond_to do |format|
      format.html {

        # create_hello_session
        redirect_to hello.classic_sign_up_welcome_path, notice: 'Welcome!'


      }
      format.json {

        # render json: @credential, status: :created, location: hello.classic_sign_up_welcome_path
        

      }
    end
  end


  set :error do
    #@credential
    # user = @credential.user

    # register failed attempt if email was found

    respond_to do |format|
      format.html {

        render :sign_up


      }
      format.json {
        
        # render json: @credential.errors, status: :unprocessable_entity
        

      }
    end
  end



end

