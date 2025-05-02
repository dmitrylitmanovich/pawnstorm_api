module Auth::Actions::Login
  class Create < Hanami::Action
    include PawnstormAPI::Deps["repos.user_repo"]

    params do
      required(:email).filled(:string)
      required(:password).filled(:string)
    end

    def handle(request, response)
      halt 422, json(error: "Invalid params") unless request.params.valid?

      user = user_repo.find_by_email(request.params[:email])
      unless user && PawnstormAPI::Auth.verify_password(user.password_digest, request.params[:password])
        halt 401, json(error: "Invalid credentials")
      end

      token = PawnstormAPI::Auth.generate_token(user.id)
      response.format = :json
      response.body = { token: token }
    end
  end
end
