module Auth::Actions::Register
  class Create < Auth::Action
    include Auth::Import["repos.user_repo"]

    params do
      required(:email).filled(:string)
      required(:password).filled(:string)
    end

    def handle(request, response)
      halt 422, { error: "Invalid params" }.to_json unless request.params.valid?

      existing = user_repo.find_by_email(request.params[:email])
      halt 409, { error: "Email already taken" }.to_json if existing

      hashed = PawnstormAPI::Auth.hash_password(request.params[:password])
      user = user_repo.create(
        email: request.params[:email],
        password_digest: hashed,
        created_at: Time.now
      )

      token = PawnstormAPI::Auth.generate_token(user.id)
      response.status = 201
      response.format = :json
      response.body = { token: token }
    end
  end
end
