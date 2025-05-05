module Auth::Actions::Login
  class Create < Hanami::Action
    include Auth::Import["repos.user_repo"]

    params do
      required(:email).filled(:string)
      required(:password).filled(:string)
    end

    def handle(request, response)
      unless request.params.valid?
        response.status = 422
        response.body = { error: "Invalid params" }.to_json
        return
      end

      user = user_repo.find_by_email(request.params[:email])

      unless user && PawnstormAPI::Auth.valid_password?(request.params[:password], user.password_digest)
        response.status = 401
        response.body = { error: "Invalid credentials" }.to_json
        return
      end

      token = PawnstormAPI::Auth.generate_token(user.id)
      response.status = 200
      response.body = { token: token }.to_json
    end
  end
end
