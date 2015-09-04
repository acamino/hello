module Hello
  module Modules
    module UpdateProfile

      def success
        respond_to do |format|
          format.html { redirect_to hello.current_user_path }
          format.json { render json: @user.to_hash_profile, status: :ok }
        end
      end

      def failure
        respond_to do |format|
          format.html { render :show }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end

    end
  end
end
